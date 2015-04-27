(function() {
  
  "use strict";

  var app = angular.module("ApiResources");

  app.factory("EtfRsrc", [
    "$resource",
    "$cacheFactory",
    function($resource, $cacheFactory){
      var etfRsrc;
      var route = "/api/etf.json";
      var cache = $cacheFactory.get("EtfRsrc");

      if ( !cache ) {
        cache = $cacheFactory("EtfRsrc");
      }

      etfRsrc = $resource(route, {}, {
        'get': {
          method: 'get',
          cache: cache
        }
      });

      return etfRsrc;

  }]);

})();
