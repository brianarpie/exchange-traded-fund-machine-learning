// Karma configuration
// Generated on Sun Apr 05 2015 12:40:42 GMT-0400 (EDT)

module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '../',

    plugins: [
      'karma-jasmine',
      'karma-phantomjs-launcher',
      'karma-spec-reporter',
      'karma-ng-html2js-preprocessor'
    ],

    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
      'vendor/assets/javascripts/jquery/dist/jquery.js',
      'vendor/assets/javascripts/angular/angular.js',
      'vendor/assets/javascripts/angular-resource/angular-resource.js',
      'vendor/assets/javascripts/angular-route/angular-route.min.js',
      'vendor/assets/javascripts/angular-bootstrap/ui-bootstrap-tpls.js',
      'vendor/assets/javascripts/angular-mocks/angular-mocks.js',
      'vendor/assets/javascripts/moment/moment.js',
      'vendor/assets/javascripts/underscore/underscore.js',
      'vendor/assets/javascripts/d3/d3.js',
      'app/assets/javascripts/modules.js',
      'app/assets/javascripts/**/*directive.html',
      'app/assets/javascripts/**/*.js',
      'spec/javascripts/**/*Spec.js'
    ],


    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      'app/assets/javascripts/**/*directive.html': ['ng-html2js']
    },
    

    ngHtml2JsPreprocessor: {
      cacheIdFromPath: function(filepath) {
        return "/assets" + filepath.split('/javascripts').pop();
      },
      moduleName: 'Templates'
    },

    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['dots', 'spec'],
          
          
    // spec reporter options
    specReporter: {maxLogLines: 5},


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: true
  });
};
