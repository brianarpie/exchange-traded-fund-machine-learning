(function() {

  "use strict";

  var app = angular.module("EtfCannonApp");

  app.controller("EtfCannonController", [
  "$scope", 
  function($scope){

    function init() {
      $scope.msg = "Goondight!";
    }

    init();

  }])  

})();
