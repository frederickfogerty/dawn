gulp = require('gulp')
gutil = require('gulp-util')
watch = require('gulp-watch') # Much more powerful than gulp.watch
coffeelint = require('gulp-coffeelint')
source = require('vinyl-source-stream')
browserify = require('gulp-browserify')
concat = require('gulp-concat')
stylus = require('gulp-stylus')
coffee = require('gulp-coffee')
jade = require('gulp-jade')
autoprefixer = require('gulp-autoprefixer')
refresh = require('gulp-livereload')
nodemon = require('gulp-nodemon')

plumber = require('gulp-plumber')
beep = require('beepbeep')

expressServer = require('./server')
browserSync = require('browser-sync')
reload      = browserSync.reload

onError = (err) ->
  beep [0,0,0]
  gutil.log gutil.colors.red err

gulp.plumbedSrc = ->
  return gulp.src.apply( gulp, Array.prototype.slice.call( arguments ))
    .pipe plumber({
        errorHandler: onError
      }) 

gulp.task "serve_", ->
  console.log "Server"
  expressServer.startServer()

gulp.task "serve", ->
  nodemon(
    script: "server.js"
    ext: "json js"
    ignore: [
      "public/*"
      "client/*"
    ])
    .on("change", ["lint"])
    .on "restart", ->
      console.log "Restarted webserver"

gulp.task 'browser-sync', ->
  browserSync 
    server:
      baseDir: "public"
      routes: 
        "/bower_components": "../bower_components"
    
    # proxy: 'localhost:8080'


# Dev task
gulp.task "dev", [
  "views"
  "styles"
  "lint"
  "js"
  "watch"
  'browser-sync'
], ->


# JSLint task
gulp.task "lint", ->
  gulp
    .plumbedSrc "client/scripts/**/*.coffee"
    .pipe coffeelint()
    .pipe coffeelint.reporter()


# Styles task
gulp.task "styles", ->
  # The onerror handler prevents Gulp from crashing when you make a mistake in your SASS
  # Optionally add autoprefixer
  # These last two should look familiar now :)
  gulp
    .plumbedSrc "client/styles/**/*.stylus"
    .pipe stylus(use: [require('stylus-type-utils')()])
    .pipe autoprefixer("last 2 versions", "> 1%", "ie 8")
    .pipe gulp.dest "public/css/"
    .pipe reload stream:true


# Browserify task
gulp.task "js", ->
  return gulp.plumbedSrc('client/scripts/main.coffee', {read: false})
    .pipe browserify( transform: ['coffeeify'], extensions: ['.coffee'] )
    .pipe concat("core.js")
    .pipe gulp.dest 'public/js'



# Views task
gulp.task "views", ->
  
  # Get our index.jade
  # And put it in the public folder
  gulp.plumbedSrc("client/index.jade")
    .pipe jade()
    .pipe gulp.dest("public/")
    .pipe reload stream:true
  
  # Any other view files from client/views
  # Will be put in the public/views folder
  gulp.src("client/views/**/*.jade")
    .pipe jade()
    .pipe gulp.dest("public/views/")
    .pipe reload stream:true

gulp.task "watch", [
  # "serve"
  "lint"
], ->
  
  # Start live reload server
  # refresh.listen()
  
  # Watch our scripts, and when they change run lint and browserify
  gulp.watch [
    "client/scripts/*.coffee"
    "client/scripts/**/*.coffee"
  ],[
    "lint"
    "js"
    reload
  ]
  
  # Watch our sass files
  gulp.watch ["client/styles/**/*.stylus"], ["styles"]
  
  # Watch view files
  gulp.watch ["client/**/*.jade"], ["views"]
  # gulp.watch("./public/**")
  #   .on "change", reload

gulp.task "default", ["dev"]