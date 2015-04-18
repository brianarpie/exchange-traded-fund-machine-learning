(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("ChartController", [
  "$scope", 
  function($scope){

    function init() {
      $scope.msg = "Goondight!";
    }

    init();

  }])  

})();
