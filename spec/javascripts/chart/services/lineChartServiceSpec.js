(function() {

  "use strict";

  describe("Line Chart Service Unit Test", function() {
    var $rootScope, $scope, LineChartSrvc;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $scope = $rootScope.$new();
      LineChartSrvc = $injector.get("LineChartSrvc");
    }));

    // it('should have an endpoint for one')
    it('should update the chart when the data changes', function() {
      var srvc = LineChartSrvc;
    });

  });

})();