$(document).on('turbolinks:load', function() {
  $('.main-header__current-user-image').on('click', function() {
    if ($('.user-tooltip').css('display') == 'none') {
      $('.user-tooltip').css('display', 'block');
    } else {
      $('.user-tooltip').css('display', 'none');
    }
  });

  $(document).on('click touchend', function(e) {
    if (!$(e.target).closest('.main-header__current-user-image').length) {
      $('.user-tooltip').hide();
    }
  });
  
  $('#public-setting-button').on('click', function() {
    $('.note-public-setting-wrapper').remodal().open();
    $('.remodal-wrapper').appendTo('#new_note, .edit_note');
  });

  $('#submit_draft').on('click', function() {
    $('<input />').attr('type', 'hidden').attr('name', 'note[is_draft]').attr('value', true).appendTo('#new_note, .edit_note');
  });

  $('#submit_public').on('click', function() {
    $('<input />').attr('type', 'hidden').attr('name', 'note[is_draft]').attr('value', false).appendTo('#new_note, .edit_note');
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

  $('#search-box-input').on('focus keyup', function() {
    var pre_func = null;
    var pre_input = '';
    var input = '';
    input = $.trim($(this).val());

    if(input == '')
    {
      $('#search-result-box').empty();
    }
    
    if (pre_input !== input) {
      clearTimeout(pre_func);
      pre_func = setTimeout(
        $.ajax({
          url: '/notes/set_search_result_users_hashtags',
          data: {'keyword': input},
          dataType: 'script'
        }),
        500
        );
    }
    
    pre_input = input;
  });

  $('#search-result-box').on('DOMSubtreeModified propertychange', function() {
    $(this).find('li').slice(8).remove();
  });

  $('#note-tags').tagit({
    fieldName: 'note[tag_list]',
    placeholderText: 'ハッシュタグを追加',
    singleField: true,
    availableTags: gon.available_tags
  });
  
  $('#price-pay, #price-field__number').on('change', function() {
    $('#price-pay').attr('value', $('#price-field__number').val());
  });
});