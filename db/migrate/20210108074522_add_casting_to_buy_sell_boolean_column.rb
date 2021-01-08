class AddCastingToBuySellBooleanColumn < ActiveRecord::Migration[6.0]
  def change
    
      change_column :registered_items, :buy_sell, 'boolean USING CAST(buy_sell AS boolean)'
    
  end
end
