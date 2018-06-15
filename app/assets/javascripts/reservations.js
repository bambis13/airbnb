// // = form_for([@room, @room.reservations.new]) do |f|
// //   .row
// //     .col-md-12.price_tag
// //       %span
// //         $#{@room.price}
// //       %span.pull-right Per Night
// //   .row
// //     .col-md-6
// //       %label Check In
// //       = f.text_field :start_date, readonly: 'true', placeholder: 'Start Date', class: 'form-control'
// //     .col-md-6
// //       %label Check Out
// //       = f.text_field :end_date, readonly: 'true', placeholder: 'End Date', class: 'form-control', disabled: 'true'
// //   = f.hidden_field :room_id, value: @room.id
// //   = f.hidden_field :price, value: @room.price
// //   = f.hidden_field :total, id: 'reservation_total'
// //   %h4
// //     %span#message
// //   #preview{:style => "display: none"}
// //     %table.reservation-table
// //       %tbody
// //         %tr
// //           %td Day(s)
// //           %td
// //             %span#reservation_days
// //         %tr
// //           %td Total
// //           %td
// //             $
// //             %span#reservation_sum
// //     %br/
// //   = f.submit "Book Now", id: "btn_book", class: "btn btn-primary wide", disabled: 'true'


// :javascript
//   function unavailable(date) {
//     dmy = date.getDate() + "-" + (date.getMonth()+1) + "-" + date.getFullYear();
//     return [$.inArray(dmy, unavailableDates) == -1];
//   }
//   $(function() {
//     unavailableDates = [];
//     $.ajax({
//       url: '/preload',
//       data: {'room_id': #{@room.id}},
//       dataType: 'json',
//       success: function(data) {
//         $.each(data, function(arrID, arrValue) {
//           for(var d = new Date(arrValue.start_date); d <= new Date(arrValue.end_date); d.setDate(d.getDate() + 1)) {
//             unavailableDates.push($.datepicker.formatDate('d-m-yy', d));
//           }
//         });
//         $('#reservation_start_date').datepicker({
//           dateFormat: 'dd-mm-yy',
//           minDate: 0,
//           maxDate: '3m',
//           beforeShowDay: unavailable,
//           onSelect: function(selected) {
//             $('#reservation_end_date').datepicker("option", "minDate", selected);
//             $('#reservation_end_date').attr('disabled', false);
//             var start_date = $(this).datepicker('getDate');
//             var end_date = $('#reservation_end_date').datepicker('getDate');
//             var days = (end_date - start_date)/1000/60/60/24 + 1
//             var input = {
//               'start_date': start_date,
//               'end_date': end_date,
//               'room_id': #{@room.id}
//             }
//             $.ajax({
//               url: "/preview",
//               data: input,
//               success: function(data) {
//                 if (data.conflict) {
//                   $('#message').text("This date range is not available.");
//                   $('#preview').hide();
//                   $('#btn_book').attr('disabled', true);
//                 } else {
//                   $('#preview').show();
//                   $('#btn_book').attr('disabled', false);
//                   var total = days * #{@room.price}
//                   $('#reservation_days').text(days);
//                   $('#reservation_sum').text(total);
//                   $('#reservation_total').val(total);
//                 }
//               }
//             });
//           }
//         });
//         $('#reservation_end_date').datepicker({
//           dateFormat: 'dd-mm-yy',
//           minDate: 0,
//           maxDate: '3m',
//           beforeShowDay: unavailable,
//           onSelect: function(selected) {
//             $('#reservation_start_date').datepicker("option", "maxDate", selected);
//             var start_date = $('#reservation_start_date').datepicker('getDate');
//             var end_date = $(this).datepicker('getDate');
//             var days = (end_date - start_date)/1000/60/60/24 + 1
//             var input = {
//               'start_date': start_date,
//               'end_date': end_date,
//               'room_id': #{@room.id}
//             }
//             $.ajax({
//               url: "/preview",
//               data: input,
//               success: function(data) {
//                 if (data.conflict) {
//                   $('#message').text("This date range is not available.");
//                   $('#preview').hide();
//                   $('#btn_book').attr('disabled', true);
//                 } else {
//                   $('#preview').show();
//                   $('#btn_book').attr('disabled', false);
//                   var total = days * #{@room.price}
//                   $('#reservation_days').text(days);
//                   $('#reservation_sum').text(total);
//                   $('#reservation_total').val(total);
//                 }
//               }
//             });
//           }
//         });
//       }
//     });

//   });
