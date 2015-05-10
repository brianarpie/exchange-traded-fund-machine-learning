(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.service("LineChartSrvc", [
    "HoldingRsrc", function(HoldingRsrc) {

    this.updateSelectedHolding = function(newHolding) {

    };

    var onUpdateChartCallbacks = [];

    function updateChart() {
      var lineChartData;
      _.each(onUpdateChartCallbacks, function(callback) {
        callback(lineChartData);
      });
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
      
    }

    init();
    
  }]);

})();
