class Item < ActiveRecord::Base
  attr_accessible :buy, :name, :sell, :type_id
  default_scope order(:name)
  validates_presence_of :name
  validates_numericality_of :type_id
end
