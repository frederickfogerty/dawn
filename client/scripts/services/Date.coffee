exports.inject = (app) ->
  app.factory('Date', exports.factory)
  return exports.factory

exports.factory = ->
  return {}