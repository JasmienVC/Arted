class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
