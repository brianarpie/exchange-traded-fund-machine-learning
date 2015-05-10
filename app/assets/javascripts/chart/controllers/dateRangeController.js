(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.controller("DateRangeCtrl", ["$scope", function($scope) {

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
      $scope.$watch('startDate', function() {
        // console.log($scope.startDate);
      });
      $scope.$watch('endDate', function() {
        // api call.?
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
