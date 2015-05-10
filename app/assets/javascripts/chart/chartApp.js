(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.config([
    "$locationProvider",
    "$routeProvider",
    function($locationProvider, $routeProvider) {
      $locationProvider.html5Mode(true);
      $routeProvider.when('/', {
        templateUrl: '/assets/chart/pages/index.html',
        controller: 'ChartCtrl'
      });
    }
  ]);

})();
