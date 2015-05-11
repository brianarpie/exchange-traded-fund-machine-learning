(function() {

  "use strict";

  describe("Line Chart Service Unit Test", function() {
    
    var $rootScope, $scope, $httpBackend, 
      LineChartSrvc, HistoricalPriceRsrc, ChartSubscriptionSrvc;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get("$rootScope");
      $httpBackend = $injector.get("$httpBackend");
      HistoricalPriceRsrc = $injector.get("HistoricalPriceRsrc");
      $scope = $rootScope.$new();
      
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      spyOn(ChartSubscriptionSrvc, 'subscribe').and.callThrough();
      LineChartSrvc = $injector.get("LineChartSrvc");
      
      $httpBackend.when("GET", /\/api\/historical_price\.json/).respond([{
        close: "59.71", date: "2014-01-02", high: "60.52", id: 265, low: "55.56", open: "56.54", priceable_id: 3, priceable_type: "Holding", volume: 4243200
      }]);

    }));

     afterEach(function() {
       $httpBackend.verifyNoOutstandingExpectation();
       $httpBackend.verifyNoOutstandingRequest();
     });
    
    it('should subscribe to changes in the selected holding', function() {
      expect(ChartSubscriptionSrvc.subscribe.calls.first().args[0]).toEqual("holdingChanged");
      $httpBackend.flush();
    });

    it('should subscribe to changes in the date range', function() {
      expect(ChartSubscriptionSrvc.subscribe.calls.mostRecent().args[0]).toEqual("dateChanged");
      $httpBackend.flush();
    });

    it('should get the historical price data when the holding changes', function() {
      var historical_price;
      LineChartSrvc.onUpdateChart(function(data) {
        historical_price = data;
        expect(historical_price[0].close).toEqual("59.71");
      });
      ChartSubscriptionSrvc.publish("holdingChanged", "SCTY");
      $httpBackend.flush();
    });

  });

})();