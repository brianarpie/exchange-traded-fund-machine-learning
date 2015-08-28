(function() {
  
  "use strict";

  var app = angular.module("ApiResources");

  app.factory("EtfHoldingRsrc", [
    "$resource",
    "$cacheFactory",
    function($resource, $cacheFactory){
      var etfHoldingRsrc;
      var route = "/api/etf_holding.json";
      var cache = $cacheFactory.get("EtfHoldingRsrc");

      if ( !cache ) {
        cache = $cacheFactory("EtfHoldingRsrc");
      }

      etfHoldingRsrc = $resource(route, {}, {
        'get': {
          method: 'get',
          cache: cache,
          isArray: true
        }
      });

      return etfHoldingRsrc;

  }]);

})();
