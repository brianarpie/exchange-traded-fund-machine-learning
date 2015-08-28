(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.service("LineChartSrvc", [
    "ChartSubscriptionSrvc", 
    "HistoricalPercentageRsrc",

    function(ChartSubscriptionSrvc, HistoricalPercentageRsrc) {

    var onUpdateChartCallbacks = [];
    var queryContainer = {
      start_date: null,
      end_date: null,
      holding_symbol: null,
      etf_symbol: null
    };

    function updateChart(newDatum) {
      var lineChartData;
      _.each(newDatum, function(datum, key) {
        queryContainer[key] = datum;
      });
      if (queryContainer.etf_symbol && queryContainer.holding_symbol) {
        HistoricalPercentageRsrc.get(queryContainer).$promise.then(function(data) {
          _.each(onUpdateChartCallbacks, function(callback) {
            callback(data);
          });
        });
      }
    }

    function updateEtf(etf) {
      if (_.isString(etf.name) && _.isNumber(etf.id))
        updateChart({etf_symbol: etf.name});
    }

    function updateHolding(holding) {
      if (_.isString(holding.name) && _.isNumber(holding.id))
        updateChart({holding_symbol: holding.name});
    }

    function updateDateRange(dates) {
      if (_.isObject(dates))
        updateChart(dates);
    }

    this.getMinPrice = function(data) {
      return _.min(_.pluck(data, "low"));
    };

    this.getMaxPrice = function(data) {
      return _.max(_.pluck(data, "high"));
    };

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
      ChartSubscriptionSrvc.subscribe("etfChanged", updateEtf);
      ChartSubscriptionSrvc.subscribe("dateChanged", updateDateRange);
    }

    init();
    
  }]);

})();
