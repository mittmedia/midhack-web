var midhack = midhack || {};
midhack.labeled_input = function() {
  var onClass = 'labeled_input__label--on';
  var showClass = 'labeled_input__label--show';

  $('input', '.labeled_input').bind('checkval',function(evt) {
    var $input = $(this);
    var $label = $input.prev('label');
    if($input.val() !== '') {
      $label.addClass(showClass);
    }

    if(evt.target === document.activeElement) {
      $label.addClass(showClass);
      var text = $input.data('placeholder') || '';
      $input.attr('placeholder', text);
    } else {
      if(!$input.data('placeholder') && $input.hasClass(showClass)) {
        $input.attr('placeholder','');
      }else{
        $input.attr('placeholder', $label.text());
        if($input.val() === '') {
          $label.removeClass(showClass);
        }
      }
    }
  }).on('keyup',function() {
    $(this).trigger('checkval');
  }).on('focus',function() {
    $input = $(this);
    $input.prev('label').addClass(onClass);
    $input.trigger('checkval');
  }).on('blur',function() {
    $input = $(this);
    $input.prev('label').removeClass(onClass);
    $input.trigger('checkval');
  }).trigger('checkval');
};
$(document).ready(midhack.labeled_input);
$(document).on('page:load', midhack.labeled_input);
