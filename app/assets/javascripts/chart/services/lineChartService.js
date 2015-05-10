(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.service("LineChartSrvc", [
    "ChartSubscriptionSrvc", function(ChartSubscriptionSrvc) {

    var onUpdateChartCallbacks = [];

    function updateChart() {
      var lineChartData;
      _.each(onUpdateChartCallbacks, function(callback) {
        callback(lineChartData);
      });
    }

    function updateHolding(holdingName) {
      // updateChart({holding});
    }

    this.onUpdateChart = function(callback) {
      onUpdateChartCallbacks.push(callback);
      return {
        cleanup: function() {
          onUpdateChartCallbacks = _.without(onUpdateChartCallbacks, callback);
        }
      };
    };
    
    function init() {
      ChartSubscriptionSrvc.subscribe("holdingChanged", updateHolding);
    }

    init();
    
  }]);

})();
