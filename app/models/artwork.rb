class Artwork < ApplicationRecord
  validates :title, :price, :shipping_costs, :photos, presence: true
  belongs_to :user
  has_many_attached :photos
end
