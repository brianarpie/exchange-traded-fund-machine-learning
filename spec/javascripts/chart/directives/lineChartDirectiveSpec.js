(function() {

  "use strict";

  describe("Line Chart Directive Unit Test", function() {
    var $rootScope, $scope, $compile, lineChartElement;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $compile = $injector.get("$compile");

      $scope = $rootScope.$new();

      lineChartElement = $compile("<line-chart></line-chart>")($scope);
    }));

    // it("should draw an x-axis", function() {
    //   // console.log(lineChartElement.find(".x-axis"));
    //   expect(lineChartElement.find(".x-axis").length).toBe(1);
    // });
  });

})();
