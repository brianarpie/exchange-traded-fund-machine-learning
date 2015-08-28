(function() {

  "use strict";

  // TODO: export to a fixture
  var historicalPriceData = [{
    date: "2014-01-02", 
    open: "56.54", 
    close: "59.71", 
    high: "60.52", 
    low: "55.56", 
    volume: 4243200
  }];

  describe("Line Chart Service Unit Test", function() {
    
    var $rootScope, $scope, $httpBackend, 
      LineChartSrvc, ChartSubscriptionSrvc;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $httpBackend = $injector.get("$httpBackend");
      $scope = $rootScope.$new();
      
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      spyOn(ChartSubscriptionSrvc, 'subscribe').and.callThrough();
      LineChartSrvc = $injector.get("LineChartSrvc");
      
      $httpBackend.when("GET", /\/api\/historical_price\.json/).respond(historicalPriceData);

    }));

     afterEach(function() {
       $httpBackend.verifyNoOutstandingExpectation();
       $httpBackend.verifyNoOutstandingRequest();
     });
    
    it('should subscribe to changes in the selected holding', function() {
      expect(ChartSubscriptionSrvc.subscribe.calls.first().args[0]).toEqual("holdingChanged");
    });

    it('should subscribe to changes in the date range', function() {
      expect(ChartSubscriptionSrvc.subscribe.calls.mostRecent().args[0]).toEqual("dateChanged");
    });

    xit('should get the historical price data when the holding changes', function() {
      var historical_price;
      LineChartSrvc.onUpdateChart(function(data) {
        historical_price = data;
        expect(historical_price[0].close).toEqual("59.71");
      });
      ChartSubscriptionSrvc.publish("holdingChanged", "SCTY");
      $httpBackend.flush();
    });

    it('should have a function to get the min price', function() {
      var minPrice = LineChartSrvc.getMinPrice(historicalPriceData);
      expect(minPrice).toEqual("55.56");
    });

    it('should have a function to get the max price', function() {
      var maxPrice = LineChartSrvc.getMaxPrice(historicalPriceData);
      expect(maxPrice).toEqual("60.52");
    });

  });

})();