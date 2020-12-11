class Server < ApplicationRecord
  has_many :registered_items
  has_many :users
end
