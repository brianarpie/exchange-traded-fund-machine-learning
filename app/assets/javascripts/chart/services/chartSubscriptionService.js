(function() {

  "use strict";

  angular.module("ChartApp").service("ChartSubscriptionSrvc", [
    function() {
      console.log("init subscribe")
      
      var chartEvents = {
        holdingChanged: {
          eventHandlers: [],
          cache: []
        }
      };

      this.subscribe = function(eventName, handler) {
        var chartEvent = chartEvents[eventName];

        chartEvent.eventHandlers.push(handler);
        handler(chartEvent.cache);

        return {
          cleanup: function() {
            chartEvent.eventHandlers = _.without(chartEvent.eventHandlers, handler);
          }
        };
      };

      this.publish = function(eventName, data) {
        var chartEvent = chartEvents[eventName];

        chartEvent.cache = _.clone(data);
        _.each(chartEvent.eventHandlers, function(eventHandler) {
          eventHandler(chartEvent.cache);
        });
      };

  }]);

})();
