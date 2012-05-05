class SeedDatacoreIntoGroups < ActiveRecord::Migration
  def up
    Group.create name: 'datacore'
  end

  def down
    Group.find_by_name('datacore').destroy
  end
end
