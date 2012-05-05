class Blueprint < ActiveRecord::Base
  attr_accessible :item_id, :relic_id

  belongs_to :item
  belongs_to :relic

  def name
    [self.item.name, 'Blueprint'] * ' '
  end

  def buy
    self.relic.materials.collect(&:buy).inject(:+)
  end

  def profit
    self.item.sell - self.buy
  end

  def profit_in_percent
    (self.profit * 100 / self.buy).round
  end
end
