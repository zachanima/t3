# Parse currency, return float value
from_currency = (isk) ->
  Number(isk.replace(/[^0-9\.-]+/g,''))

jQuery ->
  total = 0.0
  $('div#blueprints a.corp').click ->
    id = $(this).attr('href').substr 1
    span = $(this).children('span')
    quantity_span = $('div#blueprint_' + id + ' span.qty')
    total += from_currency(span.html())
    $('div.total span').html(to_currency(total))
    quantity_span.html(Number(quantity_span.html()) + 1)
