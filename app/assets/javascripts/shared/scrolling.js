function isScrolledIntoView(elem) {
  var $elem = $(elem);
  var $window = $(window);

  var docViewTop = $window.scrollTop();
  var docViewBottom = docViewTop + $window.height();

  var elemTop = $elem.offset().top;
  var elemBottom = elemTop + $elem.height();

  return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}

function infiniteScroll(selector) {
  $(selector).ready(function() {
    var originalOffset = gon.offset;
    var offset = gon.offset;
    var filtered = gon.filtered;
    var tagIds = gon.tag_ids;
    var url = gon.more_url;
    var loading = 0;

    function lastRow() {
      $.ajax({
        url: url,
        type: 'POST',
        dataType: 'script',
        data: { resource: { offset: offset, filtered: filtered, tag_ids: tagIds } }
      })
      .done(function() {
        offset = offset + originalOffset;
        loading = 0;
      })
      .fail(function() {
        console.log("error");
      });
    };

    $(window).scroll(function() {
      if (isScrolledIntoView('#last-row-loader') && (loading++ === 0)) {
        lastRow();
      }
    });
  });
}
