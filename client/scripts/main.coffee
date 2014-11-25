require('angular')

uiRoute = require('angular-ui-router')
app = angular.module('MyApp', [uiRoute])

require('./services/Auth').inject(app)
require('./directives/ExampleDirective').inject(app)

app.config( ($locationProvider, $stateProvider) ->

  $locationProvider.html5Mode(true)

  $stateProvider
  .state('home', {
    url: '/',
    templateUrl: 'views/home.html',
    controller: require('./controllers/ExampleCtrl').inject(app)
  })
  .state('second', {
    url: '/second-page',
    controller: require('./controllers/ExampleCtrl').inject(app),
    templateUrl: 'views/secondary.html'
  })
)

app.run()
