(function() {

  "use strict";

  // here we declare all our modules and their underlying dependencies
  angular.module("UiResources", ["ui.bootstrap"]);
  angular.module("ApiResources", []);
  angular.module("ChartApp",  ["ngRoute", "ngResource", "ApiResources", "UiResources"]);
  angular.module("WelcomeApp", ["ngRoute"]);

})();
