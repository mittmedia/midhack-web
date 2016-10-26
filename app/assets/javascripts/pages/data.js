var midhack = midhack || {};
midhack.ready = function() {
  if($('#data').length === 1) {
    var $section_headers = jQuery('.data_section_header');
    $section_headers.on('click', function(){
      var slideDuration = 400;
      $section = $(this).next();
      $upArrow = $('.upArrow', this);
      $downArrow = $('.downArrow', this);
      if($section.css('display') === 'none') {
        $section.stop(true, true).fadeIn({ duration: slideDuration, queue: false }).css('display', 'none').slideDown(slideDuration);
        $upArrow.show();
        $downArrow.hide();
      } else {
        $section.stop(true, true).fadeOut({ duration: slideDuration, queue: false }).slideUp(slideDuration);
        $upArrow.hide();
        $downArrow.show();
      }
    });
  }
};

$(document).ready(midhack.ready);
$(document).on('turbolinks:load', midhack.ready);
