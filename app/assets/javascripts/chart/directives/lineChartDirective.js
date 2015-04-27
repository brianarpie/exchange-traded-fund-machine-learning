(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.directive("LineChart", [function() {

      function link($scope, $element, $attr) {

        function init() {
          
        }

        init();

      }

      return {
        restrict: "EA",
        link: link,
        template: "/app/assets/chart/pages/_line_chart_directive.html"
      };
  }]);

})();
