(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("ChartController", [
  "$scope", "ChartMetricService",
  function($scope, ChartMetricService) {

    function getAllHoldings() {
      ChartMetricService.getHoldings().then(
        function(holdings) {
          $scope.holdings = _.filter(holdings, function(holding) {
            return holding.name; // filter out $promise objects etc.
          });
      }); 
    }

    function init() {
      getAllHoldings();
      $scope.selectedHolding = "STOCK";
    }

    init();

  }]);

})();
