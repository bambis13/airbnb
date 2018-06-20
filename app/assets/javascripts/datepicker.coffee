ready = ->
  dateFormat = 'yy/mm/dd';
  $('.reservation-checkin').datepicker(
    dateFormat: dateFormat,
    minDate: 0
  );
  $('.reservation-checkout').datepicker(
    dateFormat: dateFormat,
    minDate: 0
  );
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
