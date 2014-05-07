$(document).ready(function(){

  $(document).on('keyup', function(event) {
    //detcet which key is pressed and call the appropriate function
    // google "jquery keyup what key was pressed" if you don' know how
    if (event.which == 65) {
    $('#player1_race td.active')
        .removeClass('active')
        .next('td').addClass('active')
    };

    if (event.which == 80) {
    $('#player2_race td.active')
        .removeClass('active')
        .next('td').addClass('active')
    };
  });
});