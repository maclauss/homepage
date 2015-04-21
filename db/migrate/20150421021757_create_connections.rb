class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :ip_address_id, null: false
      t.integer :count, null: false, default: 0

      t.timestamps null: false
    end
    add_index :connections, :user_id
    add_index :connections, :ip_address_id
    add_index :connections, [:user_id, :ip_address_id], unique: true
  end
end
