# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#dataTables-example').dataTable({
    "columnDefs": [{
      "targets": 2,
      "orderable": false
    }, {
      "targets": 3,
      "orderable": false
    }, {
      "targets": 4,
      "orderable": false
    }
    ]
  })
