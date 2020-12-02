class Item < ApplicationRecord
  has_many :registered_items
  has_many :users, through: :registered_items
end
