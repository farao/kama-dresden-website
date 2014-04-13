# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  createDatePopup = (date, allDay, jsEvent, view) ->
    if allDay
      window.location.href="courses/new?year=" + date.getFullYear() + "&month=" + (date.getMonth() + 1) + "&day=" + date.getDate()

  $('#calendar').fullCalendar
    firstDay: 1
    aspectRatio: 2
    dayClick: createDatePopup
    events:
      url: '/courses/dates'
      backgroundColor: 'yellow'

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
