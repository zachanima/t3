class RemoveNameFromRelics < ActiveRecord::Migration
  def up
    remove_column :relics, :name
  end

  def down
    add_column :relics, :name, :string
  end
end
