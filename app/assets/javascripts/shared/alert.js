$(document).ready(function() {
  var alert = $('div.alert');

  var fadeAlertOut = function() {
    alert.fadeOut('slow');
  }

  if (alert !== undefined) {
    setTimeout(fadeAlertOut, 5000);
  };
});
