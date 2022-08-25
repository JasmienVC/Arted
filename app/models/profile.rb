class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :artworks, through: :user
end
