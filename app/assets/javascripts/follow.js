$(document).ready(function(){
  $('body').on('click', '.follow', function(){
    var relation_id = $(this).data('relation-id');
    $.ajax({
      url: '/relationships/' + relation_id,
      type: 'patch',
      dataType: 'JSON',
      data: {
        id: relation_id,
        status: 1
      },success: function(result) {
        $('.start-room').html('');
        $('.start-room').append(result.html);
      }
    });
  });

  $('body').on('click', '.unfollow', function(){
    var relation_id = $(this).data('relation-id');
    $.ajax({
      url: '/relationships/' + relation_id,
      type: 'patch',
      dataType: 'JSON',
      data: {
        id: relation_id,
        status: 0
      },success: function(result) {
        $('.start-room').html('');
        $('.start-room').append(result.html);
      }
    });
  });
});
