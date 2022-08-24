class ArtworkTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  enum status: {
    pending: 0,
    paid: 1,
    shipped: 2,
    received: 3
  }
end
