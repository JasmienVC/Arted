class Artwork < ApplicationRecord
  validates :title, :price, :shipping_costs, :photos, presence: true
  belongs_to :user
  has_one :artwork_transaction
  has_many_attached :photos
  include PgSearch::Model
  multisearchable against: %i[title description user]
end
