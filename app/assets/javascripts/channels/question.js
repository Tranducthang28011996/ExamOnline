$(document).ready(function() {
  App.cable.subscriptions.create('QuestionChannel', {
    received: function(data) {

    }
  });
});
