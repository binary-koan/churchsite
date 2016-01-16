pad = (n, width, z='0') ->
  n = n + ''
  if n.length >= width then n
  else new Array(width - n.length + 1).join(z) + n

$ ->
  # Date Selection
  $('.datepicker').datepicker format: 'dd/mm/yyyy', weekStart: 1

  # Viewing
  $datePicker = $('.news-date-picker')
  date = $datePicker.data('date')

  load_events = (year, month, day) ->
    $.getJSON "/news/events?year=#{year}&month=#{month}&day=#{day}", ({ days, content }) ->
      load_event_dates(days)
      $('#news-container').replaceWith(content)
      activate_current_week()

  load_event_dates = (data) ->
    $days = $('td.day')
    start_index = 0
    end_index = $days.length
    $days.each (i) ->
      if i is start_index and parseInt($(this).text()) > 1
        start_index++
      else if i > start_index + 1 and parseInt($(this).text()) is 1
        end_index = i
        return false
    $days.each (i) ->
      return if i < start_index
      return false if i >= end_index
      if data.indexOf(parseInt $(this).text()) isnt -1
        $(this).addClass 'eventful'

  activate_current_week = ->
    $active = $datePicker.find('td.day.active')
    return unless $active.length > 0
    $active.parent().children().each ->
      $(this).addClass 'current-week' unless $(this).hasClass 'active'

  $datePicker.datepicker weekStart: 1, format: "dd/mm/yyyy", todayHighlight: true
  load_events(date.substring(6, 10), date.substring(3, 5), date.substring(0, 2)) if date
  activate_current_week()

  $datePicker.on 'changeDate', (e) ->
    load_events(e.date.getFullYear(), e.date.getMonth() + 1, e.date.getDate())
    activate_current_week()

  $datePicker.on 'changeMonth', (e) ->
    $datePicker.datepicker('setDate', e.date)
