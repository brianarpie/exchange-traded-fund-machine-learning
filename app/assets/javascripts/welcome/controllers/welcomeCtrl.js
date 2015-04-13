(function(){

  "use strict";

  var app = angular.module("WelcomeApp");

  app.controller("WelcomeController", ["$scope", function($scope) {

    function init() {
      $scope.welcomeMessage = "Parsed Cache 不無為";
    }

    init();

  }]);

})();
