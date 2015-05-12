(function() {

  "use strict";

  // TODO: export to a fixture
  var fixtureData = [{
    date: "2014-01-02", 
    open: "56.54", 
    close: "59.71", 
    high: "60.52", 
    low: "55.56", 
    volume: 4243200
  },{
    date: "2014-01-03", 
    open: "59.71", 
    close: "60.04", 
    high: "60.14", 
    low: "59.65", 
    volume: 3021900
  }];

  describe("Line Chart Directive Unit Test", function() {
    var $rootScope, $scope, $compile, ChartSubscriptionSrvc, LineChartSrvc, $httpBackend,  lineChartElement;
    beforeEach(module("ChartApp"));
    beforeEach(module("Templates"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $compile = $injector.get("$compile");
      $httpBackend = $injector.get("$httpBackend");
      $scope = $rootScope.$new();
      $httpBackend.expect("GET", /\/api\/historical_price\.json/).respond(fixtureData);

      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      LineChartSrvc = $injector.get("LineChartSrvc");

      lineChartElement = $compile("<line-chart></line-chart>")($scope);
      
      ChartSubscriptionSrvc.publish("holdingChanged", "FUCK");
      $httpBackend.flush();
    }));

    afterEach(function() {
      $httpBackend.verifyNoOutstandingExpectation();
      $httpBackend.verifyNoOutstandingRequest();
    });

    it('should draw an x-axis', function() {
      expect(lineChartElement.find('.x.axis').length).toBe(1);
    });

    it('should draw a y-axis', function() {
      expect(lineChartElement.find(".y.axis").length).toBe(1);
    });

    it('should draw (data.length - 1) lines', function() {
      expect(lineChartElement.find('.lines').length).toBe(fixtureData.length - 1);
    });

  });

})();
