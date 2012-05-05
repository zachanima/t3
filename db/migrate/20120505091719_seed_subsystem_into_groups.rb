class SeedSubsystemIntoGroups < ActiveRecord::Migration
  def up
    Group.create name: 'subsystem'
  end

  def down
    Group.find_by_name('subsystem').destroy
  end
end
