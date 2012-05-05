class Blueprint < ActiveRecord::Base
  attr_accessible :item_id, :relic_id

  belongs_to :item
  belongs_to :relic
end
