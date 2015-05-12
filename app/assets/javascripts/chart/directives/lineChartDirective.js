(function() {

  "use strict";

  var app = angular.module("ChartApp");

  app.directive("lineChart", ["LineChartSrvc", 
    function(LineChartSrvc) {

      function link($scope, $element, $attr) {
        var chart = {};

        function drawChart(data) {
          
          chart.data = data;

          chart.margin = {top: 0, right: 25, bottom: 30, left: 5};

          if (_.isEmpty(chart.data))
            return;

          if (!chart.root)
            chart.root = buildChartContainer();

          chart.height = $element.find('.chart-root').height() - chart.margin.top - chart.margin.bottom;
          chart.width = $element.find('.chart-root').width() - chart.margin.left - chart.margin.right;

          // TODO: modify these functions so that chart.data isn't passed around ?

          // TODO: have LineChartSrvc spit out the data as x and y? along with the other info in another object for tooltip display

          var minPrice = LineChartSrvc.getMinPrice(chart.data);
          var maxPrice = LineChartSrvc.getMaxPrice(chart.data);

          chart.xScale = buildXScale();
          chart.yScale = buildYScale(minPrice, maxPrice);

          chart.xAxis = buildXAxis();
          chart.yAxis = buildYAxis();

          // TODO: create a tooltip

          if ($element.find('.x.axis').length === 0)
            drawXAxis();

          if ($element.find('.y.axis').length === 0)
            drawYAxis();

          updateXAxis();
          updateYAxis();

          chart.lineFunction = getLineFunction();
          drawLines();
        }

        function buildChartContainer() {
          return d3.select($element.find(".chart-root")[0])
            .attr("width", "100%")
            .attr("height", "100%")
              .append("g")
              .attr("class", "chart-container");
        }

        function buildXScale() {
          return d3.time.scale()
            .domain([moment(chart.data[0].date).toDate(), moment(chart.data[chart.data.length - 1].date).toDate()])
            .rangeRound([30, chart.width]);
        }

        function buildYScale(priceMin, priceMax) {
          return d3.scale.linear()
            .domain([priceMin, priceMax])
            .range([chart.height, 0]);
        }

        function buildXAxis() {
          return d3.svg.axis()
            .scale(chart.xScale)
            .orient("bottom")
            .ticks(d3.time.months, 1)
            .tickFormat(d3.time.format(getTimeFormatter()))
            .tickSize(-chart.height, 0, 0);
        }

        function buildYAxis() {
          return d3.svg.axis()
            .scale(chart.yScale)
            .orient("right")
            .tickSize(chart.width, 0, 0)
            .tickFormat(function(d){ return "$" + d; });
        }

        function drawXAxis() {
          chart.root.append("g")
            .attr('class', 'x axis')
            .attr('transform', 'translate(0, ' + chart.height + ')')
            .call(chart.xAxis);
        }

        function drawYAxis() {
          chart.root.append("g")
            .attr("class", "y axis")
            .call(chart.yAxis);
        }

        function updateXAxis() {
          chart.root.select('.x.axis')
            .transition()
            .duration(500)
            .call(chart.xAxis);
        }

        function updateYAxis() {
          chart.root.select('.y.axis')
            .transition()
            .duration(500)
            .call(chart.yAxis);
        }

        function getLineFunction() {
          return d3.svg.line()
            .x(function(d, i) {
              return chart.xScale(moment(d.date).toDate());
            })
            .y(function(d, i) {
              return chart.yScale(d.close);
            });
        }

        function drawLines() {
          chart.lines = chart.root
            .selectAll("path.lines")
            .data([chart.data]);

          chart.lines.enter()
            .append("path")
              .attr('class', 'lines')
              .attr('opacity', 0);
          
          chart.lines.transition()
            .duration(600)
            .attr('d', chart.lineFunction)
            .attr('opacity', 1);

          chart.lines.exit()
            .transition()
            .duration(600)
            .attr('opacity', 0)
            .remove();
        }

        // TODO: this needs work.
        function getTimeFormatter() {
          var milliseconds =  moment(
            moment(chart.data[chart.data.length - 1].date) - 
            moment(chart.data[0].date)
          );
          var years = ( ( ( ( ( milliseconds / 1000 ) / 60 ) / 60 )/ 24 ) / 365 );

          return (years < 2) ? "%b \'%y" : "%Y";
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
