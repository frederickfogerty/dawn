exports.inject = (app) ->
  # require('./Date').inject(app)
  app.factory "Appointment", exports.factory
  return exports.factory

exports.factory = ($http) ->
  factory = {}

  appointments = []

  days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  for day in days
    for i in [0..3]
      appointments.push
        time:
          start: (Math.floor((Math.random()*6))+9)+":00"
          end: '15:00'
          date: day
        label: "yo" 

  factory.appointments = () ->
    return appointments

  return factory