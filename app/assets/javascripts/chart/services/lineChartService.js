(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.service("LineChartSrvc", [
    "ChartSubscriptionSrvc", "HistoricalPriceRsrc", function(ChartSubscriptionSrvc, HistoricalPriceRsrc) {

    var onUpdateChartCallbacks = [];
    var queryContainer = {
      start_date: null,
      end_date: null,
      symbol: null
    };

    function updateChart(newDatum) {
      var lineChartData;
      _.each(newDatum, function(datum, key) {
        queryContainer[key] = datum;
      });

      HistoricalPriceRsrc.get(queryContainer).$promise.then(function(data) {
        _.each(onUpdateChartCallbacks, function(callback) {
          callback(data);
        });
      });
    }

    function updateHolding(holdingName) {
      if (_.isString(holdingName))
        updateChart({symbol:holdingName});
    }

    function updateDateRange(dates) {
      if (_.isObject(dates))
        updateChart(dates);
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
      ChartSubscriptionSrvc.subscribe("dateChanged", updateDateRange);
    }

    init();
    
  }]);

})();
