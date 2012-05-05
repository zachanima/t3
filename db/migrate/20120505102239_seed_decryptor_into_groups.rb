class SeedDecryptorIntoGroups < ActiveRecord::Migration
  def up
    Group.create name: 'decryptor'
  end

  def down
    Group.find_by_name('decryptor').destroy
  end
end
