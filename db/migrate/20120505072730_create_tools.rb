class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.references :item
      t.references :relic
      t.integer :quantity

      t.timestamps
    end
  end
end
