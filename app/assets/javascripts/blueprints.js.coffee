jQuery ->
  # Expand/collapse blueprint group on click.
  $('div#blueprints a.list').click ->
    if $(this).parent('li').attr('class') == 'open'
      $(this).parent('li').attr('class', 'closed')
    else
      $(this).parent('li').attr('class', 'open')
  
  # Show only selected blueprint on click.
  $('div#blueprints a[href!=#]').click ->
    id = $(this).attr('href').substr 1
    $('div.blueprint').hide()
    $('div#blueprint_' + id).show()

    $('div#blueprints a').removeClass('active')
    $(this).addClass('active')
