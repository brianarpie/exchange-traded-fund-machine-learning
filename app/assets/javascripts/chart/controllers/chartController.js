(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("ChartCtrl", [
  "$scope", "LineChartSrvc", "ChartSubscriptionSrvc", "HoldingRsrc",
  function($scope, LineChartSrvc, ChartSubscriptionSrvc, HoldingRsrc) {
    function fetchHoldings() {
      HoldingRsrc.get().$promise.then(function(data) {
        $scope.holdings = data;
      });
    }

    function init() {
      fetchHoldings();
      $scope.$watch('selectedHolding', function(holding) {
        if (holding)
          ChartSubscriptionSrvc.publish("holdingChanged", holding);
      });
      // $scope.selectedHolding = "STOCK";
    }

    init();

  }]);

})();
