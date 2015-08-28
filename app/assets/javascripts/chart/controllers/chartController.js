(function() {

  "use strict";
  
  var app = angular.module("ChartApp");

  app.controller("ChartCtrl", [
  "$scope", 
  "LineChartSrvc", 
  "ChartSubscriptionSrvc", 
  "EtfRsrc",
  "HoldingRsrc", 
  "EtfHoldingRsrc",
  function($scope, LineChartSrvc, ChartSubscriptionSrvc, EtfRsrc, HoldingRsrc, EtfHoldingRsrc) {
    function fetchEtfHoldings() {
      EtfHoldingRsrc.get().$promise.then(function(data) {
        $scope.etfHoldings = data;
      });
    }

    function fetchEtfs() {
      EtfRsrc.get().$promise.then(function(data) {
        $scope.etfs = data;
      });
    }

    function fetchHoldings(etf) {
      HoldingRsrc.get({etf_id: etf.id}).$promise.then(function(data) {
        $scope.holdings = data;
      });
    }

    function init() {
      fetchEtfs();
      $scope.$watch('selectedEtf', function(etf) {
        if (etf)
          ChartSubscriptionSrvc.publish("etfChanged", etf);
      });
      $scope.$watch('selectedHolding', function(holding) {
        if (holding)
          ChartSubscriptionSrvc.publish("holdingChanged", holding);
      });
      ChartSubscriptionSrvc.subscribe("etfChanged", fetchHoldings)
    }

    init();

  }]);

})();
