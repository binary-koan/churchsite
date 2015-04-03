$ ->
  # Description of date entry format
  $('.input-group-addon[data-toggle=tooltip]').tooltip()

  # Editing
  $('.btn-announcement').parent().next().hide()
  $('.btn-announcement').click ->
    $(this).toggleClass 'active'
    $(this).parent().next().toggle()

  $('.news-edit-btn').click (e) ->
    e.preventDefault()
    $el = $(this)
    $el.toggleClass('active')
    $el.next().toggle()
    $el.parent().parent().find('.news-display').toggle()
    $el.parent().parent().find('.news-editor').toggle()
