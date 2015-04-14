(function() {
  
  "use strict";
  
  module.exports = function(grunt) {

    grunt.config.init({

      jshint: {

      },
      concat: {

      },
      uglify: {

      },
      karma: {
        unit: {
          configFile: 'karma.conf.js'
        }
      }

    });

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-karma');
    grunt.loadNpmTasks('grunt-browserify');

    grunt.registerTask('test', ['concat', 'karma']);

    grunt.registerTask('default', ['jshint', 'uglify']);
  
  }

})();
