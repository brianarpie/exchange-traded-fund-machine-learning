(function() {

  "use strict";

  describe("Etf Cannon Controller Unit Test", function() {
    var $rootScope, $scope, $controller;

    beforeEach(module("EtfCannonApp"));
    beforeEach(inject(function($injector) {
      $rootScope = $injector.get('$rootScope');
      $scope = $rootScope.$new();
      $controller = $injector.get('$controller');

      $controller('EtfCannonController', {
        "$scope": $scope
      });
    }));

    it("should assert something", function() {
      expect($scope.msg).toEqual("Goondight!");
    });

  });

})();