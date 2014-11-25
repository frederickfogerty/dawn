exports.inject = (app) ->
  app.factory "Auth", exports.factory
  exports.factory

exports.factory = ($http) ->
  sdo =
    isLoggedIn: false
    username: ""

  _urls =
    auth: "/api/login"
    signup: "/api/signup"

  login: (data) ->
    $http.post _urls.auth, data

  signup: (data) ->
    $http.post _urls.signup, data

  setLoggedIn: (bool) ->
    sdo.isLoggedIn = bool
    return