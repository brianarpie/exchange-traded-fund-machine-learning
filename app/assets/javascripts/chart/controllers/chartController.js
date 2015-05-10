(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("ChartController", [
  "$scope", "LineChartService",
  function($scope, LineChartService) {

    function getAllHoldings() {

    }

    function init() {
      // getAllHoldings();
      $scope.$watch('selectedHolding', function(newSelectedHolding) {

      });
      $scope.selectedHolding = "STOCK";
    }

    init();

  }]);

})();
