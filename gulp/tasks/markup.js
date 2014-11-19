var gulp = require('gulp');
var jade = require('gulp-jade');

gulp.task('markup', function() {
  return gulp.src('src/templates/*.jade')
    .pipe(jade({
      pretty: false
    }))
    .pipe(gulp.dest('build'));
});
