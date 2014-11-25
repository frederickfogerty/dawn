exports.inject = (app) ->
  app.controller "ApplicationBarController", exports.controller
  exports.controller

exports.controller = ($scope) ->
  $scope.name = "Something"
  