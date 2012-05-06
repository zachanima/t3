class Blueprint < ActiveRecord::Base
  attr_accessible :item_id, :relic_id, :decryptor_id

  belongs_to :item
  belongs_to :relic
  belongs_to :decryptor, class_name: 'Item', foreign_key: :decryptor_id

  scope :grouped, lambda { |group|
    includes(:item).where 'items.name like ?', "#{group}%"
  }

  def name
    [self.item.name, 'Blueprint'] * ' '
  end

  def subsystem?
    not %w[Legion Loki Proteus Tengu].include? self.item.name
  end

  def profit_in_percent
    (self.profit * 100 / self.buy).round
  end

  def intact_per_run
    (self.relic.intact.buy + self.relic.tools_buy + self.decryptor.buy) / (20 * 0.84)
  end

  def malfunctioning_per_run
    (self.relic.malfunctioning.buy + self.relic.tools_buy + self.decryptor.buy) / (10 * 0.63)
  end

  def wrecked_per_run
    (self.relic.wrecked.buy + self.relic.tools_buy + self.decryptor.buy) / (3 * 0.42)
  end

  def per_run
    [self.intact_per_run, self.malfunctioning_per_run, self.wrecked_per_run].min *
      (self.subsystem? ? 4 : 1)
  end

  def cheapest_relic
    if per_run == intact_per_run * (self.subsystem? ? 4 : 1)
      'intact'
    elsif per_run == malfunctioning_per_run
      'malfunctioning'
    else
      'wrecked'
    end
  end

  def material_buy
    self.relic.materials.collect(&:buy).inject(:+)
  end

  def buy
    self.material_buy + self.per_run
  end

  def profit
    self.item.sell - self.buy
  end

  def best?
    blueprints = Blueprint.includes(:item).where('items.name like ?',
        "#{self.name.split[0]} #{self.name.split[1]}%")

    blueprints.reject{ |b| b === self }.each do |blueprint|
      if blueprint.profit > self.profit
        return false
      end
    end
    true
  end
end
