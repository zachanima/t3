class Tool < ActiveRecord::Base
  attr_accessible :item_id, :quantity, :relic_id

  belongs_to :item
  belongs_to :relic

  validates_numericality_of :item_id, :quantity
end
