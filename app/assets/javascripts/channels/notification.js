$(document).ready(function() {
  App.cable.subscriptions.create('RoomChannel', {
    received: function(data) {
      if(data.checked == true){
        console.log(data);
        if (data.ready == true) {
          console.log("true");
          return;
        }
        if (data.ready == false){
          console.log("false");
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
