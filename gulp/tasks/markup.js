var gulp = require('gulp');
var jade = require('gulp-jade');

gulp.task('markup', function() {
  return gulp.src('src/templates/*.jade')
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest('build'));
});
