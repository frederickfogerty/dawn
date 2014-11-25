# Dawn

The next best thing since sliced bread, a.k.a. a Calendar

## Download & Run

- git clone http://github.com/frederickfogety/dawn.git [folder]
- cd [folder]
- npm install
- gulp

That's it. Now visit [http://localhost:8080](http://localhost:8080) and profit.

## What's this gulp business?

Gulp is an awesome system that runs on node.js. It is a task runner, and in this project, it is configured to do a few things:

-  compiles [CoffeeScript](http://coffeescript.org/) files into js
-  compiles [Stylus](http://learnboost.github.io/stylus/) files into CSS
-  compiles [Jade](http://jade-lang.com/) files into HTML
-  uses [browserify](http://browserify.org/) for nested dependency management 
-  checks your CoffeeScript code for possible style and code issues at compile-time
-  *[WIP]* will eventually test your code for you

## Contributing

All source code for the client is situated in `client/`, likewise with the server in `api/`. You should never have to touch `public/`, that is what the browser sees, and is not committed to the git repo, and is constantly overwritten.

### Angular.js

We are using [Angular.js](https://angularjs.org/), which is built by Google, because it is a very good SPA framework, and makes our life super easy. Look up [this](https://www.youtube.com/watch?v=i9MHigUZKEM) tutorial on YouTube if you want to learn more.

### CoffeeScript

CoffeeScript simply provides a nice abstraction away from JS, allowing code to be cleaner and more concise. CoffeeScript also provides some nice reusable functionality which otherwise would take ages to program.

### Stylus, Jade

[Stylus, Jade] is to [CSS, HTML] like Coffeescript is to JS.

### Browserify

Pure wizardry. Just don't ask, it's awesome.


## API

So far the "backend" runs on MongoDB and is written in Node.js and JavaScript, but this will likely change to Postgres and Java, because that's what I want to learn. Sweet.

In `server.js` you will notice an **USE_API** flag you can set. When you set this to true, Frickle will automatically load all your models that live in `api/models`, connect to your MongoDB based on your ENV settings and load up the API routes from `api/routes.js`.

There's an example API Controller with corresponding Model so you can start building straight away.
