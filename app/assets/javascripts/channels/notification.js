$(document).ready(function() {
  App.cable.subscriptions.create('RoomChannel', {
    received: function(data) {
      if(data.checked == true)
        $('.player-inroom').append(data.content);
      else
        {
          $('#user-' + data.user_id).remove();
        }
    }
  });
});
