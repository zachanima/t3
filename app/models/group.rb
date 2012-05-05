class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :items

  validates :name, presence: true, uniqueness: true

  def print_name
    self.name.pluralize.capitalize
  end
end
