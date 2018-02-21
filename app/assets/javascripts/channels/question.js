$(document).ready(function() {
  App.cable.subscriptions.create('QuestionChannel', {
    received: function(data) {
      function loadQuestion() {
        var id_room = $('.question-exam').data('number-room');
        if ((sessionStorage.getItem("check_incre") == "true")){
          var tpm = parseInt(sessionStorage.getItem("number_question")) + 1;
          sessionStorage.setItem("number_question", tpm);
          console.log(tpm);
        }else {
          sessionStorage.setItem("number_question", 1);
          sessionStorage.setItem("check_incre", true);
          console.log(sessionStorage.getItem("number_question"));
        }
        $.ajax({
          url: '/rooms/' + id_room + '/exames',
          type: 'GET',
          dataType: 'json',
          data: {
            status: true,
            i: sessionStorage.getItem("number_question"),
            exame_id: sessionStorage.getItem("exame_id")
          },success: function(result) {
            if(result.status == "1"){
              window.location.replace(result.url);
            }else{
              $('.question-exam span').html(result.question);
              alert(1);
            }
          }
        });
      }
      setInterval(function(){
        if(sessionStorage.getItem("number_question") == 10){
          sessionStorage.clear();
        }else {
          loadQuestion();
        }
      }, 5000);
    }
  });
});
