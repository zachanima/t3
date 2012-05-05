class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :item
      t.references :relic
      t.integer :quantity

      t.timestamps
    end
  end
end
