$(document).on('turbolinks:load', function() {
  $('#public-setting-button').on('click', function() {
    $('.note-public-setting-wrapper').remodal().open();
    $('.remodal-wrapper').appendTo('#new_note');
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
        var $preview_class = $('.note-container__header-image');
        
        $preview_class.css('background-image', `url(${e.target.result})`);
      };
    })(file);
    
    reader.readAsDataURL(file);
  }); 

  $('#price-pay, #price-field__number').on('change', function() {
    $('#price-pay').attr('value', $('#price-field__number').val());
  });
});