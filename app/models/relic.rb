class Relic < ActiveRecord::Base
  attr_accessible :intact_id, :malfunctioning_id, :wrecked_id,
    :materials_attributes, :tools_attributes

  belongs_to :intact, class_name: 'Item', foreign_key: :intact_id
  belongs_to :malfunctioning, class_name: 'Item', foreign_key: :malfunctioning_id
  belongs_to :wrecked, class_name: 'Item', foreign_key: :wrecked_id
  has_many :materials, dependent: :destroy
  has_many :items, through: :materials
  has_many :tools, dependent: :destroy
  has_many :items, through: :tools
  has_many :blueprints

  accepts_nested_attributes_for :materials, :tools

  validates_numericality_of :intact_id, :malfunctioning_id, :wrecked_id

  def name
    self.intact.name.split[1]
  end


  def tools_buy
    self.tools.collect(&:buy).inject(:+)
  end
end
