(function() {
  
  "use strict";

  var app = angular.module("ApiResources");

  app.factory("HistoricalPriceRsrc", [
    "$resource",
    "$cacheFactory",
    function($resource, $cacheFactory){
      var historicalPriceRsrc;
      var route = "/api/historical_price.json?symbol=:symbol&start_date=:start_date&end_date=:end_date";
      var cache = $cacheFactory.get("HistoricalPriceRsrc");

      if ( !cache ) {
        cache = $cacheFactory("HistoricalPriceRsrc");
      }

      historicalPriceRsrc = $resource(route, {}, {
        'get': {
          method: 'GET',
          cache: cache,
          isArray: true
        }
      });

      return historicalPriceRsrc;

  }]);

})();
