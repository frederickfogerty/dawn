exports.inject = (app) ->
  app.directive "exampleDirective", exports.directive
  exports.directive

exports.directive = ->
  restrict: "E"
  template: "<ul>
    <li>
      <em>A simple list</em>
    </li>
    <li>
      <em>But I can be anything you want.</em>
    </li>
  </ul>"