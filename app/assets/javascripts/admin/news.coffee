$ ->
  # Description of date entry format
  $('.input-group-addon[data-toggle=tooltip]').tooltip()

  # Editing
  $('.btn-announcement').click ->
    $(this).toggleClass 'active'
    $(this).parent().next().toggleClass('hidden')

  $('.news-edit-btn').click (e) ->
    e.preventDefault()
    $el = $(this)
    $el.toggleClass('active')
    $el.next().toggle()
    $el.parent().parent().find('.news-display').toggle()
    $el.parent().parent().find('.news-editor').toggle()
