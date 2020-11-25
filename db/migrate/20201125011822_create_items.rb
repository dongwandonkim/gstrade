class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,      null: false, default: ""
      t.integer :price,    null: false, default: ""
      t.text :description, null: true, default: ""
      t.timestamps
    end
  end
end
