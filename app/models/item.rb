class Item < ActiveRecord::Base
  attr_accessible :buy, :name, :sell, :type_id
end
