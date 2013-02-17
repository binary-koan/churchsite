$ ->
  # Pagination
  $('.pagination').each ->
    el = $(this)
    list = $('<ul>')

    old_prev_page = el.children '.previous_page'
    prev_page = $('<li>').attr('rel', 'prev')
    prev_page.append $('<a>').attr('href', old_prev_page.attr('href')).html '<i class="icon-left"></i>'
    prev_page.addClass 'disabled' if old_prev_page.hasClass 'disabled'
    old_prev_page.remove()
    list.append prev_page

    old_next_page = el.children '.next_page'
    next_page = $('<li>').attr('rel', 'next')
    next_page.append $('<a>').attr('href', old_next_page.attr('href')).html '<i class="icon-right"></i>'
    next_page.addClass 'disabled' if old_next_page.hasClass 'disabled'
    old_next_page.remove()

    el.children().each ->
      child = $(this)
      page = $('<li>')
      page.addClass 'active' if child.hasClass 'current'
      page.append $('<a>').attr('href', child.attr('href')).html child.html()
      child.remove()
      list.append page

    list.append next_page
    $(this).append list

  # Audio Player
  $('audio').audioPlayer
    strPlay: '<i class="icon-play"></i>'
    strPause: '<i class="icon-pause"></i>'
    strVolume: '<i class="icon-volume"></i>'
