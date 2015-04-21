class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|
      t.string :ip_address, null: false, unique: true

      t.timestamps null: false
    end
    add_index :ip_addresses, :ip_address, unique: true
  end
end
