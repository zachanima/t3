jQuery ->
  # Expand/contract list item children on click.
  $('div#blueprints a.list').click ->
    item = $(this).parent('li')
    if (item.attr('class') == 'open')
      item.attr('class', 'closed')
    else
      item.attr('class', 'open')

  # Show only selected blueprint on click.
  $('div#blueprints a[href!=#]').click ->
    id = $(this).attr('href').substr 1
    $('div.blueprint').hide()
    $('div#blueprint_' + id).show()
