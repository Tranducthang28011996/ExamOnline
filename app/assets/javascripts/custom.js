$(document).ready(function(){
  $('body').on('click', '.message-sigup', function(){
    $('.form .register-form').show();
    $('.form .login-form').hide();
  });

  $('body').on('click', '.message-sigin', function(){
    $('.form .register-form').hide();
    $('.form .login-form').show();
  });
  // document.getElementById("defaultOpen").click();
});

// function openCity(evt, room) {
//   var i, tabcontent, tablinks;
//   tabcontent = document.getElementsByClassName("tabcontent");
//   for (i = 0; i < tabcontent.length; i++) {
//       tabcontent[i].style.display = "none";
//   }
//   tablinks = document.getElementsByClassName("tablinks");
//   for (i = 0; i < tablinks.length; i++) {
//       tablinks[i].className = tablinks[i].className.replace(" active", "");
//   }
//   document.getElementById(room).style.display = "block";
//   evt.currentTarget.className += " active";
// }
