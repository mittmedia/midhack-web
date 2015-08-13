ready = ->
  $('.course_button').click ->
    # put the clicked jquery object in a variable
    $this = $(this)
    # Read the data-id from the clicked object
    data_number = $this.data('id')
    # Find object with matching id
    $course_year = $("#course_years#{data_number}")
    # if the course is already open close it
    if $course_year.hasClass('year_active')
      $course_year.removeClass('year_active')
      return $this.removeClass('course_active')

    # close all other years
    $('.year').removeClass('year_active')
    $('.course_button').removeClass('course_active')

    # open years that belong to course
    $course_year.addClass('year_active')
    $this.addClass('course_active')
$(document).ready(ready)
$(document).on('page:load', ready)
