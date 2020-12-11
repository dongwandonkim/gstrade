class ChangeBuySellTypeToBooleanInRegisteredItems < ActiveRecord::Migration[6.0]
  def change
    change_column :registered_items, :buy_sell, :boolean
  end
end
