# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#calendar').fullCalendar
    firstDay: 1
    aspectRatio: 2
    events:
      url: '/courses/dates'
      backgroundColor: 'yellow'
