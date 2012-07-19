Event.observe(window, 'load', function() {
  $$('a.external').each(function(e) {
    e.target = '_blank';
  });
}, false);
