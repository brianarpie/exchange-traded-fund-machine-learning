(function(){

  "use strict";
  
  var app = angular.module("WelcomeApp");

  app.config([
    "$locationProvider",
    "$routeProvider",
    function($locationProvider, $routeProvider) {
      $locationProvider.html5Mode(true);
      $routeProvider.when('/', {
        templateUrl: '/assets/welcome/pages/index.html',
        controller: 'WelcomeController'
      });
    }
  ]);

})();
