(function() {
  
  "use strict";

  var app = angular.module("ApiResources");

  app.factory("HistoricalPercentageRsrc", [
    "$resource",
    "$cacheFactory",
    function($resource, $cacheFactory){
      var historicalPercentageRsrc;
      var route = "/api/historical_percentage.json";
      var cache = $cacheFactory.get("HistoricalPercentageRsrc");

      if ( !cache ) {
        cache = $cacheFactory("HistoricalPercentageRsrc");
      }

      historicalPercentageRsrc = $resource(route, {}, {
        'get': {
          method: 'GET',
          cache: cache,
          isArray: true
        }
      });

      return historicalPercentageRsrc;

  }]);

})();
