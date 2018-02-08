$(document).ready(function() {
  App.cable.subscriptions.create('RoomChannel', {
    received: function(data) {
      var user_ready = '<div style="height: 21px">' + '<div class="user-ready"><span>Sẵn sàng</span></div>' + '</div>'
      if(data.checked == true){
        console.log(data);
        if (data.ready == true) {
          $('.parent-user-ready').css('opacity', 1);
          $('.user-ready').html(user_ready);
          return;
        }
        if (data.ready == false){
          $('.parent-user-ready').css('opacity', 0);
          return;
        }
        $('.player-inroom').append(data.content);
      }
      else
        {
          $('#user-' + data.user_id).remove();
        }
    }
  });
});
