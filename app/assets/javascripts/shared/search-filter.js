(function($) {
  // custom css expression for a case-insensitive contains()
  jQuery.expr[':'].Contains = function(a, i, m) {
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
  };

  function listFilter(list) {
    $('#search-bar')
      .change(function() {
        var filter = $(this).val();
        if (filter) {
          $(list).find("a:not(:Contains(" + filter + "))").parent().parent().hide();
          $(list).find("a:Contains(" + filter + ")").parent().parent().show();
        } else {
          $(list).find("tr").show();
        }
        return false;
      })
      .keyup(function() {
        $(this).change();
      });
  }

  $(function() {
    listFilter($("#list"));
  });
}(jQuery));
