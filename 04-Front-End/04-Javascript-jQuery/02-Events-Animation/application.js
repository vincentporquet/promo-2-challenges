/*
  *
  * TODO: add your code here!
  *
*/

$('#message').hide().slideDown(500);

$('#message').click (function(e) {
  $(this).slideUp('slow')
});

$('#message').mouseover (function(e) {
  $(this).slidedown('slow')
});