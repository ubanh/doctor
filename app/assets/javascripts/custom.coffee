$ ->
  $("input").each((i, each) ->
    mask = $(each).data('mask')
    if (typeof mask != "undefined")
      $(each).mask(mask)
  )
