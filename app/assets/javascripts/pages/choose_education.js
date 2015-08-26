var midhack = midhack || {};
midhack.ready = function() {
  var $courses = $('.course');
  var $years = $('.year');

  function hideAllExcept($course){
    $courses.not($course).removeClass('btn_selectable--selected');
    $years.addClass('hidden');
  }

  $courses.on('btn_selectable', function(evt, state) {
    var $course = $(evt.target);
    hideAllExcept($course);
    if(state === 'selected') {
      $current_course = $(evt.target);
      $current_years = $current_course.next('.year');
      $current_years.removeClass('hidden');
    }
  });
};

$(document).ready(midhack.ready);
$(document).on('page:load', midhack.ready);
