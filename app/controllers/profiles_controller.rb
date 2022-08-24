class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def edit
    authorize @profile
  end

  def update
    authorize @profile
  end

  def destroy
    authorize @profile
  end
end
