class AddReferenceToUserToServer < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :server
    add_reference :users, :server, foreign_key: true
  end
end
