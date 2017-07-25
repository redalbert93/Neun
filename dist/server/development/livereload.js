(function() {
  var lrHost = location.protocol + '//' + location.hostname + ':35729';
  var s = document.createElement('script');
  s.async = true;
  s.setAttribute('src', lrHost + '/livereload.js');
  document.body.appendChild(s);
})();