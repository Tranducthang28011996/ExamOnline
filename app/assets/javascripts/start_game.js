$(document).ready(function(){
  $('body').on('click', '.start-game', function(){
    var id = $(this).data('room');
    $.ajax({
      url: '/rooms/' + id + '/start',
      type: 'post',
      dataType: 'JSON',
      data: {
        id: id
      },success: function(result) {
      }
    });
  });
});
