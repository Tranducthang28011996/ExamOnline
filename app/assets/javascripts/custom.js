$(document).ready(function(){
  $('body').on('click', '.message-sigup', function(){
    $('.form .register-form').show();
    $('.form .login-form').hide();
  });

  $('body').on('click', '.message-sigin', function(){
    $('.form .register-form').hide();
    $('.form .login-form').show();
  });
});

function openTabs(cityName) {
    var i;
    var x = document.getElementsByClassName("tabcontent");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    document.getElementById(cityName).style.display = "block";
}
