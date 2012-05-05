jQuery ->
  # Show only selected blueprint on click.
  $('div#blueprints a').click ->
    id = $(this).attr('href').substr 1
    $('div.blueprint').hide()
    $('div#blueprint_' + id).show()

    $('div#blueprints a').removeClass('active')
    $(this).addClass('active')
