(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("DateRangeCtrl", ["$scope", "ChartSubscriptionSrvc", function($scope, ChartSubscriptionSrvc) {

    function setDefaultDateRange() {
      $scope.startDate = moment().subtract(1, 'year').format("YYYY-MM-DD");
      $scope.endDate = moment().format("YYYY-MM-DD");
    }

    function dateRangeEventHandler() {
      $scope.openEndDate = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.endDateOpened = true;
      };      
      $scope.openStartDate = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.startDateOpened = true;
      };
    }

    function dateRangeWatcher() {
      $scope.$watch('startDate', function(date) {
        ChartSubscriptionSrvc.publish("dateChanged", {
          start_date: date
        });
      });
      $scope.$watch('endDate', function(date) {
        ChartSubscriptionSrvc.publish("dateChanged", {
          end_date: date
        });
      });
    }
    
    function init() {
      setDefaultDateRange();
      dateRangeEventHandler();
      dateRangeWatcher();

      $scope.datepickerFormat = "EEEE MMMM dd, yyyy";
    }

    init();

  }]);

})();
