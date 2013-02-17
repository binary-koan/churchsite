$ ->
  # Date Selection
  $datePicker = $('#news-date-picker')

  $datePicker.datePicker(
    inline: true
    startDate: '01/01/1970'
    endDate: (new Date()).asString()
    selectWeek: true
  ).bind 'dateSelected', (e, selectedDate) ->
    if $(this).data 'first-time'
      $(this).data 'first-time', false
    else
      window.location = document.URL.replace(/\/([0-9]{8})?$/, '') + '/' + selectedDate.asString('yyyymmdd')

  dateString = /[0-9]{8}$/.exec(document.URL)
  if dateString and (dateString = dateString[0])
    $datePicker.data 'first-time', true
    $datePicker.dpSetSelected "#{dateString.substr 6,2}/#{dateString.substr 4,2}/#{dateString.substr 0,4}"

  # Editing
  $('.news-edit-btn').parent().next('form').hide()

  $('.news-edit-btn').click ->
    $el = $(this)
    $el.next().toggle()
    $el.parent().next().toggle()
