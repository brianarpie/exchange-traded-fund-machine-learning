(function() {

  "use strict";

  // TODO: declare these in a modules.js
  var app = angular.module("EtfCannonApp", ['ngRoute']);

  app.config([
    "$locationProvider",
    "$routeProvider",
    function($locationProvider, $routeProvider) {
      $locationProvider.html5Mode(true);
      $routeProvider.when('/', {
        templateUrl: '/assets/etf_cannon/pages/index.html',
        controller: 'EtfCannonController'
      });
    }
  ]);

})();
