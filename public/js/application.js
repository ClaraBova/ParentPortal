$(document).ready(function () {
  // Switch Box 2 to Login
  $('body').on('click', '#login-link', function(event) {
    event.preventDefault();

    var url = $(this).attr('href')

    $.ajax({url}).done(function(response){
      $('#section-3').html(response);
      $('#section-3').append("<a id='register-link' href='/register'>Register</a>")
    });
  });
  // Switch Box 2 to Register
  $('body').on('click', '#register-link', function(event) {
    event.preventDefault();

    var url = $(this).attr('href')

    $.ajax({url}).done(function(response){
      $('#section-3').html(response);
      $('#section-3').append("<a id='login-link' href='/login'>Login</a>")
    });
  });

  // Find local events and groups when not logged in
  $('#location-finder').on('submit', function(event){
    event.preventDefault();
    var url = $(this).attr('action'), data = $(this).serialize(), method = $(this).attr('method');

    var $ajax = $.ajax({
      url: url,
      method: method,
      data: data
    })

    $ajax.done(function(response){
      console.log(response)
      $('#head-section').addClass('no-bottom-border-radius');
      $('#section-2').html(response);
      $('#section-2').removeClass('hide')
    })
  });
});
