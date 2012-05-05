jQuery ->
  # Show only selected blueprint on click.
  $('div#blueprints a').click ->
    id = $(this).attr('href').substr 1
    $('div.blueprint').hide()
    $('div#blueprint_' + id).show()

  $('a[data-type_id]').click ->
    CCPEVE.showInfo($(this).attr 'data-type_id')
    
