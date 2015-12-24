pad = (n, width, z='0') ->
  n = n + ''
  if n.length >= width then n
  else new Array(width - n.length + 1).join(z) + n

$ ->
  # Date Selection
  $('.datepicker').datepicker format: 'dd/mm/yyyy', weekStart: 1

  # Viewing
  $datePicker = $('.news-date-picker')
  date = $datePicker.data 'date'

  load_month = (year, month) ->
    $.getJSON "/news/events_in_month?year=#{year}&month=#{month}", ({ days }) ->
      load_event_dates(days)
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
      child = $(this)
      child.addClass 'current-week' unless child.hasClass 'active'

  $datePicker.datepicker weekStart: 1, format: "dd/mm/yyyy", todayHighlight: true
  load_month date.substring(6, 10), date.substring(3, 5) if date
  activate_current_week()
  $datePicker.on 'changeDate', (e) ->
    date = e.date
    dateString = pad(date.getFullYear(), 4) + pad(date.getMonth() + 1, 2) + pad(date.getDate(), 2)
    window.location = document.URL.replace(/\/([0-9]{8})?$/, '') + '/' + dateString

  months = { January: 1, February: 2, March: 3, April: 4, May: 5, June: 6, July: 7, August: 8, September: 9, October: 10, November: 11, December: 12 }

  old_date = []
  change_month = (direction) ->
    old_date = $('.datepicker-days th.datepicker-switch').text()
    actually_change = ->
      if $('.datepicker-days th.datepicker-switch').text() is old_date
        setTimeout actually_change, 50
        return

      date = $('.datepicker-days th.datepicker-switch').text().split(' ')
      return unless date.length is 2
      year = date[1]
      month = months[date[0]]

      load_month year, month
      activate_current_week()
    setTimeout actually_change, 50

  $datePicker.on 'changeMonth', (e) ->
    load_month e.date.getFullYear(), e.date.getMonth() + 1
    activate_current_week()
  $('th.prev').click -> change_month(-1)
  $('th.next').click -> change_month(1)
