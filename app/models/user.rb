class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :artwork_transactions, dependent: :destroy
  has_many :artworks, dependent: :destroy
  has_one :profile, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_profile

  def create_profile
    Profile.create(user: self)
  end
end
