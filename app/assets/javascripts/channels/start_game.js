$(document).ready(function() {
  App.cable.subscriptions.create('StartChannel', {
    received: function(data) {
      window.location.replace(data.url);
    }
  });
});
