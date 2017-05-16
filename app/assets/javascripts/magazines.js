$(document).on('turbolinks:load', function() {
  $('input[type="file"]').on('change', function(e) {
    var file = e.target.files[0];
        
    if (file.type.indexOf('image') < 0) {
      return false;
    }

    var reader = new FileReader();
    var $this = $(this);

    reader.onload = (function(file) {
      return function(e) {
        var $preview_class = $('.magazine-form-container__header-image');
        
        $preview_class.css('background-image', `url(${e.target.result})`);
      };
    })(file);
    
    reader.readAsDataURL(file);
  });
});