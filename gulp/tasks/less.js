var gulp = require('gulp');
var less = require('gulp-less');

gulp.task('less', function () {
  gulp.src('./src/less/*.less')
  .pipe(less({
    compress:true,
    paths: [ '../../src/less/includes' ]
  }))
  .pipe(gulp.dest('./build'));
});
