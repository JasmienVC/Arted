class ApplicationController < ActionController::Base
  # check if the user is logged in before any action:
  before_action :authenticate_user!
end
