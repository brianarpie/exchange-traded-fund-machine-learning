(function() {
  
  "use strict";

  var app = angular.module("ChartApp");

  app.service("ChartMetricService", ["$q", "HoldingRsrc", 
    function($q, HoldingRsrc) {

      this.getHoldings = function() {
        var holdings = $q.defer();
        HoldingRsrc.get(function(data) {
          holdings.resolve(data);
        });
        return holdings.promise;
      };
      
  }]);
  
})();
