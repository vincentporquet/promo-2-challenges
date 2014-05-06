/*
  *
  * TODO: add your code here!
  *
*/
$(document).ready(function() {
    $('#message').hide().delay(500).slideDown(500)
      .on('click', function() {
          $(this).slideUp();
    });

    $('#message-wrapper')
      .on('mouseenter', function() {
          $('#message').stop(true, false).slideDown('slow');
      })

      .on('mouseleave', function() {
          $('#message').stop(true, false).slideUp('slow');
      });
});
