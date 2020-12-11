class ChangeCategoryIdToBuySell < ActiveRecord::Migration[6.0]
  def change
    rename_column :registered_items, :category_id, :buy_sell
  end
end
