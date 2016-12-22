$(document).ready(function() {
  $('#fileupload').fileupload({
    dataType: 'json',
    done: function(e, data) {
      var file;
      return file = data.result;
    },
    fail: function(e, data) {
      return alert('Upload failed');
    }
  });

  $('#right').hover(function() {
    $('.right').animate({
      scrollLeft: $('.right').right
    }, $('.right').css("width") / 1000)
  }, function() {});

  $('#left').hover(function() {
    $('.right').animate({
      scrollLeft: $('.right').left
    }, $('.right').css("width") / 1000)
  }, function() {});

  var der = function() {
    $("#article-content").scrollLeft($("#article-content").scrollLeft() + 10);
  };
  var izq = function() {
    $("#article-content").scrollLeft($("#article-content").scrollLeft() - 10);
  };

  $('#right').hover(function() {
    var intervalDelay = 20;
    intervalId = setInterval(der, intervalDelay);
  }, function() {
    clearInterval(intervalId);
  });

  $('#left').hover(function() {
    var intervalDelay = 20;
    intervalId = setInterval(izq, intervalDelay);
  }, function() {
    clearInterval(intervalId);
  });
});
