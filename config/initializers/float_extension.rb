class Float
  def isk
    ActionController::Base.helpers.number_to_currency self, unit: 'ISK', format: '%n %u'
  end
end
