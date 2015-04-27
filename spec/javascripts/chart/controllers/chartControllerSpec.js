(function() {

  "use strict";

  describe("Chart Controller Unit Test", function() {
    var $rootScope, $scope, $controller;

    beforeEach(module("ChartApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $scope = $rootScope.$new();
      $controller = $injector.get('$controller');

      $controller('ChartController', {
        "$scope": $scope
      });
    }));

  });

})();