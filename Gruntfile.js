(function() {
  
  "use strict";
  
  module.exports = function(grunt) {

    var paths = {
      dist: 'public/assets',
      tmp: 'tmp/grunt_tasks/',
      vendor: 'vendor/',
      src: {
        javascripts: 'vendor/assets/javascripts',
        app: 'vendor/app',
      }
    };

    var fileLists = {
      app: [
        // paths go here (dependencies)
        '<%= paths.src.javascripts %>/angular/angular.js',
        '<%= paths.src.app %>/**/*.js'
      ]
    }

    grunt.config.init({
      paths: paths,
      rails: {
        options: {
          port: 3000,
          environment: 'development'
        }
      },
      jshint: {
        options: {
          jshintrc: '.jshintrc'
        },
        all: [
          'Gruntfile.js',
          // careful with these paths.
          '<%= paths.src.app %>/scripts/{,**/}*.js',
          '<%= paths.src.app %>/components/*/scripts/**/*.js',
          '<%= paths.src.app %>/components/*/tests/**/*.js' 
        ]
      },
      clean: {
        all: {
          options: {
            force: true
          },
          files: [{
            dot: true,
            src: [
              // include all paths
              '<%= paths.tmp %>',
              '<%= paths.dist %>'
            ]
          }]
        },
        styles: {
          options: {
            force: true
          },
          files: [{
            dot: true,
            src: [
              '{<%= paths.tmp %>, <%= paths.dist %>}{,/**}/*.{css,less}',
              '{<%= paths.tmp %>, <%= paths.dist %>}{,/**}/*.{pgn,jpg,gif,svg}', 
            ]
          }]
        }
      },
      concat: {
        options: {
          separator: ';'
        },
        app: {
          src: fileLists.app,
          dest: '<%= paths.dist %>/scripts/application.js'
        }
      },
      ngtemplates: {
        app: {
          src: '<%= paths.src.app %>/**/pages/*.html',
          // TODO: reconfigure this
          dest: '<%= paths.src.app %>/scripts/views.js',
          options: {
            url: function(url) { 
              return url.replace(paths.src.app, '');
            },
            module: 'app', // use angular.module('mainApp');
            htmlmin: {
              collapseBooleanAttributes: true,
              collapseWhitespace: true,
              removeAttributeQuotes: true,
              removeEmptyAttributes: true,
              removeRedundantAttributes: true,
              removeScriptTypeAttributes: true,
              removeStyleLinkTypeAttributes: true
            }
          }
        } 
      },
      autoprefixer: {
        options: {
          browsers: ['last 2 versions']
        },
        multiple_files: {
          expand: true,
          flatten: true,
          src: '<%= paths.dist %>/styles/*.css',
          dest: '<%= paths.dist %>/styles/'
        }
      },
      uglify: {

      },
      karma: {
        unit: {
          configFile: 'karma.conf.js'
        }
      },
      less: {
        development: {
          options: {
            paths: []
          },
          files: {

          }
        }
      },
      cacheBust: {
        options: {
          encoding: 'utf8',
          algorithm: 'md5',
          length: 16,
          rename: true,
          deleteOriginals: true,
          baseDir: '<%= paths.dist %>/../'
        },
        assets: {
          files: [{
              src: ['app/views/{,**/}*.html*']
          }]
        }
      },
      watch: {
        scripts: {
          files: ['**/*.js'],
          tasks: ['jshint', 'karma']
        },
        css: {
          files: ['**/*.less'],
          tasks: ['less'],
          options: {
            livereload: true
          }
        }
      }

    });

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-cache-bust');
    grunt.loadNpmTasks('grunt-autoprefixer');
    grunt.loadNpmTasks('grunt-angular-templates');
    grunt.loadNpmTasks('grunt-jsbeautifier');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-karma');
    grunt.loadNpmTasks('grunt-todos');
    grunt.loadNpmTasks('grunt-browserify');

    grunt.registerTask('test', ['concat', 'karma']);
    grunt.registerTask('default', ['jshint', 'uglify']);
  
  }

})();
