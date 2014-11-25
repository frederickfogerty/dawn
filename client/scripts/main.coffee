require('angular')

moment = require('moment')
require('angular-moment')
uiRoute = require('angular-ui-router')
app = angular.module('Dawn', [uiRoute, 'angularMoment'])

require('./directives/ExampleDirective').inject(app)
require('./controllers/ApplicationBarController').inject(app)

require('./controllers/CalendarController').inject(app)

app.config( ($locationProvider, $stateProvider) ->

  $locationProvider.html5Mode(true)

  $stateProvider
    .state('calendar', {
      url: '/',
      templateUrl: 'views/calendar.html',
      controller: require('./controllers/CalendarController').inject(app)
    })
)

app.run()
