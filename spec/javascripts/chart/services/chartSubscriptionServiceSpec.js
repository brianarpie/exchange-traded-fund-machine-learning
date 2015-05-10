(function() {

  "use strict";

  describe("Chart Subscription Service Unit Test", function() {
    var $rootScope, $scope, ChartSubscriptionSrvc;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $scope = $rootScope.$new();
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
    }));

    it('should have a mechanism for subscribing to and publishing data changes', function() {
      var srvc = ChartSubscriptionSrvc;
      var data = [];
      
      srvc.subscribe("holdingChanged", function(result){
        data = result;
      });
      expect(data).toEqual([]);

      srvc.publish("holdingChanged", [1, 2, 3]);
      expect(data).toEqual([1, 2, 3]);
    });

  });

})();