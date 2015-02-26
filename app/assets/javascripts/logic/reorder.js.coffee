# Reorder lists in the admin section
#TODO: Replace with drag and drop

setup_reorder = (element_id, url) ->
  el = document.getElementById(element_id)
  return unless el

  Sortable.create el, animation: 150

  $el = $(el)
  $el.parent().find('.btn-primary').click ->
    $btn = $(this)
    $btn.attr 'disabled', true

    data = {}
    $el.children().each (i, li) ->
      data[$(li).data('document-id')] = i

    $.post url, { data: data }, ->
      $btn.attr 'disabled', false
      window.location.href = window.location.href.replace(/\/reorder$/, '')

$ ->
  setup_reorder 'community-pages'
  setup_reorder 'photos'
