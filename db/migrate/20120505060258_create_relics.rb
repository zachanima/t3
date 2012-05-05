class CreateRelics < ActiveRecord::Migration
  def change
    create_table :relics do |t|
      t.string :name
      t.integer :intact_id
      t.integer :malfunctioning_id
      t.integer :wrecked_id

      t.timestamps
    end
  end
end
