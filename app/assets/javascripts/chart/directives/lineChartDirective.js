(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.directive("LineChart", [function() {

      function link($scope, $element, $attr) {

        function drawChart() {
          var svg, lineFunc, lineDrawn;

          resetChart();
          
          svg = drawChartContainer(width, height);
          lineFunc = configD3LineFunc();
          lineDrawn = drawLine(svg, lineFunc);
        }

        function resetChart() {
          d3.select('.chart-root > *').remove();
        }

        function drawChartContainer(width, height) {
          return d3.select(".chart-root")
                  .append("svg")
                  .attr("width", width)
                  .attr("height", height);
        }

        function configD3LineFunc() {
          return d3.svg.line()
                  .x(function(d, i) {
                    return d;
                  })
                  .y(function(d, i) {
                    return d;
                  })
                  .interpolate("basis");
        }

        function drawLine(svg, lineFunc) {
          return svg.append("path")
                    .attr({
                      d: lineFunc($scope.chartData),
                      "stroke": "purple",
                      "stroke-width": 2,
                      "fill": "none"
                    });
        }

        function init() {
          var width = 300, height = 200;
          
          LineChartService.on('dataChanged', function(newData) {
            $scope.chartData = newData;
          });
          $scope.$watch('chartData', drawChart);
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
