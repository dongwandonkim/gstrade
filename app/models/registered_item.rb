class RegisteredItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :server
end
