class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  include PgSearch::Model
  multisearchable against: %i[name]
end
