class AddDecryptorIdToBlueprints < ActiveRecord::Migration
  def change
    add_column :blueprints, :decryptor_id, :integer
  end
end
