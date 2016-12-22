$(document).ready(function() {
  $('#limited-text').keyup(function(event) {
    var text = $(this).val();
    var length = text.length;

    if ($(this).hasClass('max-1000')) {
      $(this).siblings('span').html(length + "/1000 carácteres");
    } else {
      $(this).siblings('span').html(length + "/300 carácteres");
    }

    if (($(this).hasClass('max-1000') && length > 1000) || (!$(this).hasClass('max-1000') && length > 300)) {
      $(this).siblings('span').css("color", "red");
      $('[type="submit"]').attr('disabled', 'disabled');
    } else {
      $(this).siblings('span').css("color", "gray");
      $('[type="submit"]').removeAttr('disabled');
    }
  });
});
