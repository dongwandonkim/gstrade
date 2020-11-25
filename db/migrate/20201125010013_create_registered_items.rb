class CreateRegisteredItems < ActiveRecord::Migration[6.0]
  def change
    create_table :registered_items do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :server_id
      t.integer :category_id
      t.integer :quantity
      t.timestamps
    end
  end
end
