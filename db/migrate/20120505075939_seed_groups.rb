class SeedGroups < ActiveRecord::Migration
  def up
    Group.all.each &:destroy
    Group.create name: 'Salvage'
    Group.create name: 'Polymer'
    Group.create name: 'Tools'
    Group.create name: 'Relics'
  end

  def down
    Group.all.each &:destroy
  end
end
