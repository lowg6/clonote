$(document).on('turbolinks:load', function() {
  $('.follow-stats span').on('click', function() {
    var url = $(this).data('url');
    
    $.get(url, function(data) {
      var html = $(data).filter('.follower-list').html();
      $('#modal').html(html);
      $('#modal').remodal().open();;
    });
  });
});