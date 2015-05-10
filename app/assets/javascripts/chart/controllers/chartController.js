(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("ChartCtrl", [
  "$scope", "LineChartSrvc", "ChartSubscriptionSrvc", "HoldingRsrc",
  function($scope, LineChartSrvc, ChartSubscriptionSrvc, HoldingRsrc) {
    function getAllHoldings() {

    }

    function init() {
      $scope.$watch('selectedHolding', function(newSelectedHolding) {
        ChartSubscriptionSrvc.publish("holdingChanged", newSelectedHolding);
      });
      $scope.selectedHolding = "STOCK";
    }

    init();

  }]);

})();
