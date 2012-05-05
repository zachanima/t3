class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :type_id
      t.string :name
      t.float :buy
      t.float :sell

      t.timestamps
    end
  end
end
