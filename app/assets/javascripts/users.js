$(document).on('turbolinks:load', function() {
  $('.follow-stats span').on('click', function() {
    var url = $(this).data('url');
    
    $.get(url, function(data) {
      var filter_class = '';

      if (url.match('/followers')) {
        filter_class = '.follower-list';
      } else if (url.match('/following')) {
        filter_class = '.following-list';
      }

      var html = $(data).filter(filter_class).html();
      $('#modal').html(html);
      $('#modal').remodal().open();
    });
  });

  $('input[type="file"]').on('change', function(e) {
    var file = e.target.files[0];
    
    if (file.type.indexOf('image') < 0) {
      return false;
    }

    var reader = new FileReader();
    var $this = $(this);

    reader.onload = (function(file) {
      return function(e) {
        var $preview_class = null;
        var parent_class = $this.parent().attr('class');

        if (parent_class == 'user-edit-header__image-overlay') {
          $preview_class = $('.user-edit-header__image-exists');
        } else if (parent_class == 'user-edit-container__image-overlay') {
          $preview_class = $('.user-edit-container__image');
        }
        
        $preview_class.css('background-image', "url(${e.target.result})");
      };
    })(file);
    
    reader.readAsDataURL(file);
  }); 
});