class AddImageToRegisteredItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :image_tag, :string
  end
end
