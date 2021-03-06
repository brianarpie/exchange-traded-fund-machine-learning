(function() {

  "use strict";

  describe("Chart Controller Unit Test", function() {
    var $rootScope, $scope, $controller, $httpBackend, HoldingRsrc, LineChartSrvc, ChartSubscriptionSrvc;

    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $scope = $rootScope.$new();
      $controller = $injector.get('$controller');
      $httpBackend = $injector.get("$httpBackend");
      HoldingRsrc = $injector.get("HoldingRsrc");
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      LineChartSrvc = $injector.get('LineChartSrvc');

      spyOn(ChartSubscriptionSrvc, "publish");

      $httpBackend.when("GET", /\/api\/historical_price\.json/).respond({});
      $httpBackend.when("GET", /\/api\/holding.json/).respond({});
      $httpBackend.when("GET", /\/api\/etf.json/).respond({});

      $controller('ChartCtrl', {
        "$scope": $scope,
      });
    }));

    it('should publish changes when selected holding changes', function() {
      expect(ChartSubscriptionSrvc.publish).not.toHaveBeenCalled();
      $scope.$apply(function() {
        $scope.selectedHolding = "BEI";
      });
      expect(ChartSubscriptionSrvc.publish).toHaveBeenCalledWith("holdingChanged", "BEI");
    });

  });

})();