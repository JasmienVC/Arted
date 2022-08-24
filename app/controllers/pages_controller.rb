class PagesController < ApplicationController
  # don't require login on the homepage:
  skip_before_action :authenticate_user!, only: :home

  def home
    @artworks = policy_scope(Artwork)
    @artworks = Artwork.limit(6)
  end
end
