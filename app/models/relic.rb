class Relic < ActiveRecord::Base
  attr_accessible :intact_id, :malfunctioning_id, :wrecked_id

  belongs_to :intact, class_name: 'Item', foreign_key: :intact_id
  belongs_to :malfunctioning, class_name: 'Item', foreign_key: :malfunctioning_id
  belongs_to :wrecked, class_name: 'Item', foreign_key: :wrecked_id
  has_many :materials
  has_many :items, through: :materials

  validates_numericality_of :intact_id, :malfunctioning_id, :wrecked_id
end
