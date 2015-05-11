(function() {

  "use strict";

  describe("Date Range Controller Unit Tests", function() {

    var $rootScope, $scope, $controller, ChartSubscriptionSrvc;
    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $controller = $injector.get('$controller');
      ChartSubscriptionSrvc = $injector.get("ChartSubscriptionSrvc");
      $scope = $rootScope.$new();

      spyOn(ChartSubscriptionSrvc, 'publish').and.callThrough();

      $controller('DateRangeCtrl', {
        '$scope': $scope
      });
    }));

    it ('should have a default start and end date', function() {
      expect($scope.startDate).not.toBe(undefined);
      expect($scope.endDate).not.toBe(undefined);
    });

    it('should have watcher functions for open events', function() {
      expect($scope.openStartDate).not.toBe(undefined);
      expect($scope.openEndDate).not.toBe(undefined);
    });

    it('should set datepickerFormat to something', function() {
      expect($scope.datepickerFormat).not.toBe(undefined);
    });

    it('should publish date range changes to ChartSubscriptionSrvc', function() {
      $scope.startDate = moment().subtract(30, "days").format("YYYY-MM-DD");
      $scope.endDate = moment().format("YYYY-MM-DD");
      $scope.$digest();

      expect(ChartSubscriptionSrvc.publish)
        .toHaveBeenCalledWith("dateChanged", {start_date: $scope.startDate});
      expect(ChartSubscriptionSrvc.publish)
        .toHaveBeenCalledWith("dateChanged", {end_date: $scope.endDate});
      
    });
  });

})();
