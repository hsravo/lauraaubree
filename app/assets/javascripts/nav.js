// NAVBAR + FOOTER + LOADER

$('#openNav').on('click', function() {
  $('#myNav').css("width", "100%");
});

$('#closeNav').on('click', function() {
  $('#myNav').css("width", "0%");
});

$(function() {
  $('.loader-container').delay(1000).fadeOut(800);
});


$(function() {
  $('.navbar').hide().delay(1000).fadeIn(1000);
});

$(function() {
  $('.footer').hide().delay(2000).fadeIn(1500);
});