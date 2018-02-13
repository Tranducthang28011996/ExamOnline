$(document).ready(function() {
  App.cable.subscriptions.create('RoomChannel', {
    received: function(data) {
      var user_ready = '<div class="parent-user-ready" style="height: 21px">' + '<div class="user-ready"><span>Sẵn sàng</span></div>' + '</div>'
      if(data.checked == true){
        if (data.ready == true) {
          console.log( data.user_id);
          $(('#user-' + data.user_id).toString()).append(user_ready);
          return;
        }
        if (data.ready == false){
          $('.parent-user-ready').remove();
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
