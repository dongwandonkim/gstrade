class AddColumnToRegisteredItems < ActiveRecord::Migration[6.0]
  def change
    add_column :registered_items, :price, :int
  end
end
