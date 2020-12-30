class Item < ApplicationRecord
  has_many :registered_items, dependent: :destroy
  has_many :users, through: :registered_items
end
