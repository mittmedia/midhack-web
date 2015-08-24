var midhack = midhack || {};
midhack.btn_selectable = function() {
  $('.btn_selectable').click(function() {
    $this = $(this);
    if($this.hasClass('btn_selectable--selected')) {
      $this.removeClass('btn_selectable--selected');
      $this.trigger('btn_selectable', 'unselected');
    } else {
      $this.addClass('btn_selectable--selected');
      $this.trigger('btn_selectable', 'selected');
    }
  });
};
$(document).ready(midhack.btn_selectable);
$(document).on('page:load', midhack.btn_selectable);
