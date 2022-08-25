class Artwork < ApplicationRecord
  validates :title, :price, :shipping_costs, :photos, presence: true
  belongs_to :user
  has_one :profile, through: :user
  has_one :artwork_transaction, dependent: :destroy
  has_many_attached :photos
  include PgSearch::Model
  # multisearchable against: %i[title description]
  pg_search_scope :artwork_artist_search,
  against: [ :title, :description ],
  associated_against: {
    user: [:name]
  },
  using: {
    tsearch: { prefix: true }
  }
end
