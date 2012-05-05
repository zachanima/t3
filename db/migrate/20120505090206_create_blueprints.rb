class CreateBlueprints < ActiveRecord::Migration
  def change
    create_table :blueprints do |t|
      t.references :item
      t.references :relic
    end
  end
end
