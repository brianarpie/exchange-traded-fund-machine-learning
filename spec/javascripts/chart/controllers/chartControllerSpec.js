(function() {

  "use strict";

  describe("Chart Controller Unit Test", function() {
    var $rootScope, $scope, $controller, LineChartSrvc;

    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $scope = $rootScope.$new();
      $controller = $injector.get('$controller');
      LineChartSrvc = $injector.get('LineChartSrvc');

      spyOn($scope, '$watch');
      // spyOn(LineChartSrvc, 'getHoldingData');

      $controller('ChartCtrl', {
        "$scope": $scope
      });
    }));

    it('should watch the selected holding', function() {
      $scope.selectedHolding = "BEI";
      expect($scope.$watch.calls.mostRecent().args[0]).toBe("selectedHolding");
    });

  });

})();