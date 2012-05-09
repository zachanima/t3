class Item < ActiveRecord::Base
  attr_accessible :buy, :name, :sell, :type_id, :group_id

  belongs_to :group
  has_one :relic
  has_many :materials, dependent: :destroy
  has_many :relics, through: :materials
  has_many :tools, dependent: :destroy
  has_many :relics, through: :tools
  has_many :blueprints

  validates :name, presence: true, uniqueness: true
  validates :type_id, numericality: true, uniqueness: true
  validates_presence_of :group_id

  default_scope order(:group_id)
  scope :salvages, joins(:group).where('groups.name = ?', 'salvage')
  scope :polymers, joins(:group).where('groups.name = ?', 'polymer')
  scope :datacores, joins(:group).where('groups.name = ?', 'datacore')
  scope :tools, joins(:group).where('groups.name = ?', 'tool')
  scope :decryptors, joins(:group).where('groups.name = ?', 'decryptor')
  scope :relics, joins(:group).where('groups.name = ?', 'relic')
  scope :subsystems, joins(:group).where('groups.name = ?', 'subsystem')
  scope :outdated, where('updated_at < ? or buy is null or sell is null',
                         Time.now - 6.hours).limit(100)

  def sell_of_buy_in_percent
    (self.sell * 100 / self.buy).round - 100
  end
end
