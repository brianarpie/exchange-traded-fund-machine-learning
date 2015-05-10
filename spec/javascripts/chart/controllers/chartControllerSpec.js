(function() {

  "use strict";

  describe("Chart Controller Unit Test", function() {
    var $rootScope, $scope, $controller, LineChartService;

    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $scope = $rootScope.$new();
      $controller = $injector.get('$controller');
      LineChartService = $inject.get('LineChartService');

      spyOn($scope, '$watch');
      // spyOn(LineChartService, 'getHoldingData');

      $controller('ChartController', {
        "$scope": $scope
      });
    }));

    it('should watch the selected holding', function() {
      $scope.selectedHolding = "BEI";
      expect($scope.$watch.calls.mostRecent().args[0]).toBe("selectedHolding");
    });

  });

})();