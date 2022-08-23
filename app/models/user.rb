class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :artworks
  has_many :transactions
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
