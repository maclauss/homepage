class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :content

      t.timestamps null: false
    end
    add_index :comments, [:user_id, :created_at]
    add_index :comments, [:post_id, :created_at]
  end
end
