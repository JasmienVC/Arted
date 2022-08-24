class Artwork < ApplicationRecord
  belongs_to :user
  has_one :artwork_transaction
  has_many_attached :photos
end
