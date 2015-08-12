# starting to fetch a new target page
$(document).on 'page:fetch', ->
  $(document.documentElement)
    .removeClass('loaded')

  $(document.documentElement)
    .addClass('loading')

# the page has been parsed and changed to the new version and on DOMContentLoaded
$(document).on 'page:change', ->
  $(document.documentElement)
    .removeClass('loading')


# is fired at the end of the loading process
$(document).on 'page:load', ->
  $(document.documentElement)
    .addClass('loaded')
