class ChangeBuySellTypeToBooleanInRegisteredItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :registered_items, :buy_sell, :boolean
    add_column :registered_items, :buy_sell, :boolean
  end
  
end
