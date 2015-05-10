(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("ChartCtrl", [
  "$scope", "LineChartSrvc", "ChartSubscriptionSrvc", "HoldingRsrc",
  function($scope, LineChartSrvc, ChartSubscriptionSrvc, HoldingRsrc) {
    function getAllHoldings() {

    }

    function init() {
      // getAllHoldings();
      // $scope.holdings = LineChartSrvc();
      $scope.$watch('selectedHolding', function(newSelectedHolding) {
        LineChartSrvc.updateSelectedHolding(newSelectedHolding);
      });
      $scope.selectedHolding = "STOCK";
    }

    init();

  }]);

})();
