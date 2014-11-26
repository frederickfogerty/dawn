moment = require('moment')
exports.inject = (app) ->
  require('./../services/Appointment').inject(app)
  app.controller "CalendarController", exports.controller
  return exports.controller

exports.controller = ($scope, Appointment) ->
  date = moment()
  $scope.appointments = Appointment.appointments()

  $scope.days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  $scope.findDateByColumnAndRow = (col, row) ->
    date = moment().startOf('day').date(1+col+(row*7)).format("dddd, Do")
    return date
    
