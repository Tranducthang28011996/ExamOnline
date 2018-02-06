$(document).ready(function() {
  App.cable.subscriptions.create('RoomChannel', {
    received: function(data) {
      if(data.checked == true){
        if (data.ready == true) {
          console.log("true");
        }
        if (data.ready == false){
          console.log("false");
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
