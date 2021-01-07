class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  ,confirmable
  
  has_many :registered_items, dependent: :destroy
  has_many :items, through: :registered_items

  belongs_to :server
end
