$(document).ready(function () {
  $(document).on('click', '#login-link', function(event) {
    event.preventDefault();

    var url = $(this).attr('href')

    $.ajax({url}).done(function(response){
      $('#box2').html(response);
      $('#box2').append("<a id='register-link' href='/register'>Register</a>")
    });
  });

  $(document).on('click', '#register-link', function(event) {
    event.preventDefault();

    var url = $(this).attr('href')

    $.ajax({url}).done(function(response){
      $('#box2').html(response);
      $('#box2').append("<a id='login-link' href='/login'>Login</a>")
    });
  });

});
