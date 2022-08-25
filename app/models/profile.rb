class Profile < ApplicationRecord
  after_create :set_name_to_user

  belongs_to :user
  has_one_attached :photo

  def set_name_to_user
    self.user.update(name: name)
  end
end
