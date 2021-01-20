// NAVBAR + FOOTER + LOADER

$(document).on('click', '#openNav', function() {
  $('#myNav').css("width", "100%");
});

$(document).on('click', '#closeNav', function() {
  $('#myNav').css("width", "0%");
});

$(function() {
  $('.loader-container').delay(1500).fadeOut(800);
});



// HOME INDEX NAVBAR + FOOTER + SLIDER

$(function() {
  $('.navbar').hide().delay(1000).fadeIn(1000);
});

$(function() {
  $('.footer').hide().delay(1500).fadeIn(1500);
});

$(function() {
  $('#homeslider').hide().delay(1500).fadeIn(1000);
});

// ABOUT PAGE

$(function() {
  $('.about-title').hide().delay(1200).fadeIn(1000);
});

$(function() {
  $('.about-date').hide().delay(1500).fadeIn(1000);
});

$(function() {
  $('.text-eng').hide().delay(1200).fadeIn(1000);
});

$(function() {
  $('.text-fr').hide().delay(1250).fadeIn(1000);
});

$(function() {
  $('.text-resume').hide().delay(1500).fadeIn(1000);
});

$(function() {
  $('.profile-img').hide().delay(1000).fadeIn(1000);
});
