class Item < ActiveRecord::Base
  attr_accessible :buy, :name, :sell, :type_id

  validates :name, presence: true, uniqueness: true
  validates_numericality_of :type_id

  default_scope order(:name)
  scope :outdated, where('updated_at < ? or buy is null or sell is null',
                         Time.now - 6.hours).limit(100)
end
