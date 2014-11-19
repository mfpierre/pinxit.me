var gulp = require('gulp');
var less = require('gulp-less');
var handleErrors = require('../util/handleErrors');

gulp.task('less', function () {
  gulp.src('./src/less/*.less')
  .pipe(less({
    compress:true,
    paths: [ '../../src/less/includes' ]
  }))
  .on('error', handleErrors)
  .pipe(gulp.dest('./build'));
});
