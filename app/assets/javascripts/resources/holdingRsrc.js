(function() {
  
  "use strict";

  var app = angular.module("ApiResources");

  app.factory("HoldingRsrc", [
    "$resource",
    "$cacheFactory",
    function($resource, $cacheFactory){
      var holdingRsrc;
      var route = "/api/holding.json";
      var cache = $cacheFactory.get("HoldingRsrc");

      if ( !cache ) {
        cache = $cacheFactory("HoldingRsrc");
      }

      holdingRsrc = $resource(route, {}, {
        'get': {
          method: 'GET',
          cache: cache,
          isArray: true
        }
      });

      return holdingRsrc;

  }]);

})();
