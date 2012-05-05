class Relic < ActiveRecord::Base
  attr_accessible :intact_id, :malfunctioning_id, :name, :wrecked_id
end
