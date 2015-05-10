(function() {

  "use strict";

  describe("Chart Controller Unit Test", function() {
    var $rootScope, $scope, $controller, LineChartSrvc, ChartSubscriptionSrvc;

    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $scope = $rootScope.$new();
      $controller = $injector.get('$controller');
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      LineChartSrvc = $injector.get('LineChartSrvc');

      spyOn(ChartSubscriptionSrvc, "publish");

      $controller('ChartCtrl', {
        "$scope": $scope,
      });
    }));

    it('should publish changes to selectedHolding to ChartSubscriptionSrvc', function() {
      expect(ChartSubscriptionSrvc.publish).not.toHaveBeenCalled();
      $scope.$apply(function() {
        $scope.selectedHolding = "BEI";
      });
      expect(ChartSubscriptionSrvc.publish).toHaveBeenCalledWith("holdingChanged", "BEI");
    });

  });

})();