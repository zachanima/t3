class Item < ActiveRecord::Base
  attr_accessible :buy, :name, :sell, :type_id, :group_id

  belongs_to :group
  has_one :relic
  has_many :materials, dependent: :destroy
  has_many :relics, through: :materials
  has_many :tools, dependent: :destroy
  has_many :relics, through: :tools

  validates :name, presence: true, uniqueness: true
  validates_presence_of :group_id
  validates_numericality_of :type_id

  default_scope order(:name)
  scope :outdated, where('updated_at < ? or buy is null or sell is null',
                         Time.now - 6.hours).limit(100)
end
