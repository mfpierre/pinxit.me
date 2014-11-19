var gulp = require('gulp');
var jade = require('gulp-jade');
var handleErrors = require('../util/handleErrors');

gulp.task('markup', function() {
  gulp.src('src/templates/*.jade')
  .pipe(jade({
    pretty: false
  }))
  .on('error', handleErrors)
  .pipe(gulp.dest('build'));
});
