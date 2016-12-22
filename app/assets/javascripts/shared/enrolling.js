$(document).ready(function() {

  var enrollable_type_var = "";
  if ($('body.topics').length > 0) {
    enrollable_type_var = 'Topic';
  } else if ($('body.virtual_rooms').length > 0) {
    enrollable_type_var = 'VirtualRoom';
  }

  function enroll(button) {
    $.ajax({
        url: '/enrollments',
        type: 'POST',
        dataType: 'script',
        data: {
          enrollable_id: button.attr('data-id'),
          enrollable_type: enrollable_type_var
        }
      })
      .done(function() {
        button.removeClass('enroll green')
          .addClass('unenroll red')
          .html('Dejar de seguir');
      })
      .fail(function() {
        console.log("error");
      });
  }

  function unenroll(button) {
    $.ajax({
        url: '/users/unenroll',
        type: 'DELETE',
        dataType: 'script',
        data: {
          enrollable_id: button.attr('data-id'),
          enrollable_type: button.attr('data-type')
        }
      })
      .done(function() {
        button.removeClass('unenroll red')
          .addClass('enroll green')
          .html('Seguir');
      })
      .fail(function() {
        console.log("error");
      });
  }

  var enrollUnenroll = function() {
    if ($(this).hasClass('enroll')) {
      enroll($(this));
    } else {
      unenroll($(this));
    }
  }

  $(document).on('click', '.enroller', {}, enrollUnenroll);
});
