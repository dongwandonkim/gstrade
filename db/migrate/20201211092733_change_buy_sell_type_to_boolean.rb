class ChangeBuySellTypeToBoolean < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :registered_items, :buy_sell, :boolean
    end

    def down
      change_column :registered_items, :buy_sell, :integer
    end
  end
end
