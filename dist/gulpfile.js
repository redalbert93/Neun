'use strict';
 
var gulp = require('gulp');
var sass = require('gulp-sass');
var server = require('gulp-server-livereload');
var cleanCSS = require('gulp-clean-css');

gulp.task('sass', function () {
  return gulp.src('./client/src/scss/src/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./client/dist/css/'))
    .pipe(cleanCSS({compatibility: 'ie8'}))
    .pipe(gulp.dest('./server/assets/css'));
});
 

gulp.task('copy', function() {
  return gulp.src('./client/src/views/**')
    .pipe(gulp.dest('./server/views/'));
});

gulp.task('copy-assets', function() {
  return gulp.src('./client/src/fonts/**')
    .pipe(gulp.dest('./server/assets/fonts'));
});


gulp.watch('./client/src/scss/**/*.scss', ['sass']);
gulp.watch('./client/src/views/**', ['copy']);


gulp.task('webserver', ['copy', 'copy-assets', 'sass'], function() {
  gulp.src('./client/src')
    .pipe(server({
      livereload: true,
      directoryListing: true,
      open: false
    }));
});



gulp.task('development', ['sass:watch']);