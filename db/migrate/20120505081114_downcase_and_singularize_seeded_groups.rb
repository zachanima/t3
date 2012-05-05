class DowncaseAndSingularizeSeededGroups < ActiveRecord::Migration
  def up
    Group.all.each do |group|
      group.name = group.name.singularize.downcase
      group.save
    end
  end

  def down
    Group.all.each do |group|
      group.name = group.name.pluralize.capitalize
      group.save
    end
  end
end
