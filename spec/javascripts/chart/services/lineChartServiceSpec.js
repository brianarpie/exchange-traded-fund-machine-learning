(function() {

  "use strict";

  describe("Line Chart Service Unit Test", function() {
    var $rootScope, $scope, LineChartSrvc, ChartSubscriptionSrvc;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $scope = $rootScope.$new();
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      
      spyOn(ChartSubscriptionSrvc, 'subscribe');
      
      LineChartSrvc = $injector.get("LineChartSrvc");

    }));

    it('should subscribe to changes in the selected holding', function() {
      expect(ChartSubscriptionSrvc.subscribe.calls.mostRecent().args[0]).toEqual("holdingChanged");
    });

  });

})();