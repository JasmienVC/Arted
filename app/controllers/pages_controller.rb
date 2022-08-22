class PagesController < ApplicationController
  # don't require login on the homepage:
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
