// NAVBAR + FOOTER + LOADER

$(document).on('click', '#openNav', function() {
  $('#myNav').css("width", "100%");
});

$(document).on('click', '#closeNav', function() {
  $('#myNav').css("width", "0%");
});

$(function() {
  $('.loader-container').delay(1000).fadeOut(800);
});

// HOME INDEX NAVBAR + FOOTER + SLIDER

$(function() {
  $('.navbar').hide().delay(1000).fadeIn(1000);
});

$(function() {
  $('.footer').hide().delay(2500).fadeIn(1500);
});

$(function() {
  $('#homeslider').hide().delay(1000).fadeIn(1000);
});
