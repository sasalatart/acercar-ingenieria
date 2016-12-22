$(document).ready(function() {
  $('#scroller').click(function(e) {
    e.preventDefault();
    $('html, body').animate({
      scrollTop: $("#major-title").offset().top
    }, 1000);
    return false;
  });

  $('.question').click(function(event) {
    $(this).css("background-color", "#267dff");
    var yo = $(this).siblings('.answer')[0];

    $('.answer').each(function(index) {
      if (yo == this && $(this).css("display") == "none") {
        var ans = $(this);
        ans.css("height", "0");
        ans.css("display", "block").animate({
          "height": 100
        }, 200);
      } else {
        $(this).siblings('.question').css("background-color", "#8cbaff");
        var h = $(this).css("height");
        $(this).animate({
          "height": "0px"
        }, 200, function() {
          $(this).css("display", "none");
          $(this).css("height", h);
        });
      }
    });
  });
});
