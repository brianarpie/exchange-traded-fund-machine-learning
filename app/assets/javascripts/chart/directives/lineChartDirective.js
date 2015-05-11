(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.directive("lineChart", ["LineChartSrvc", 
    function(LineChartSrvc) {

      function link($scope, $element, $attr) {
        var chart = {};

        function drawChart(data) {
          chart.data = data;
          
          if (_.isEmpty(chart.data))
            return;

          if (!chart.root)
            chart.root = buildChartContainer();

          chart.height = $element.find('.chart-root').height();
          chart.width = $element.find('.chart-root').width();

          // TODO: modify these functions so that chart.data isn't passed around ?

          var minPrice = LineChartSrvc.getMinPrice(chart.data);
          var maxPrice = LineChartSrvc.getMaxPrice(chart.data);

          chart.yScale = buildYScale(minPrice, maxPrice);


          chart.timeScale = buildTimeScale()

          chart.xAxis = buildXAxis();
          chart.yAxis = buildYAxis();

          drawXAxis();
          drawYAxis();

          chart.line = configD3LineFunc();
          // lineDrawn = drawLine(svg, lineFunc);
        }

        function buildChartContainer() {
          return d3.select($element.find(".chart-root")[0])
            .attr("width", "100%")
            .attr("height", "100%")
              .append("g")
              .attr("class", "chart-container");
        }

        function buildXAxis() {
          return d3.svg.axis()
            .scale(chart.timeScale)
            .orient("bottom")
            .tickSize(-chart.height, 0, 0);
        }

        function drawXAxis() {
          chart.root.append("g")
            .attr('class', 'x axis')
            .attr('transform', 'translate(0, ' + chart.height + ')')
            .call(chart.xAxis);
        }

        function updateXAxis() {

        }

        function buildYScale(priceMin, priceMax) {
          return d3.scale.linear()
            .domain([priceMin, priceMax])
            .range([chart.height, 30]);
        }

        function buildYAxis() {
          return d3.svg.axis()
            .scale(chart.yScale)
            .orient("left")
            .tickSize(-chart.width, 0, 0)
            .tickFormat(function(d){ return "$" + d; });
        }

        function drawYAxis() {
          chart.root.append("g")
            .attr("class", "y axis")
            .call(chart.yAxis);
        }

        function updateYAxis() {

        }

        function buildTimeScale() {
          return d3.time.scale()
            .domain([chart.data[0].date, chart.data[chart.data.length - 1].date])
            .range([30, chart.width]);
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

        function drawLine() {
          return chart.root.append("path")
                    .attr({
                      d: chart.line(chart.data),
                      "stroke": "purple",
                      "stroke-width": 2,
                      "fill": "none"
                    });
        }

        function init() {          
          LineChartSrvc.onUpdateChart(function(data) {
            drawChart(data);
          });
        }

        init();

      }

      return {
        restrict: "EA",
        link: link,
        templateUrl: "/assets/chart/pages/_line_chart_directive.html"
      };

  }]);

})();
