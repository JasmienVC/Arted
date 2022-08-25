class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    authorize @profile
    # raise
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.user = current_user
    authorize @profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    authorize @profile
    @profile.destroy
    redirect_to root_path, status: :see_other
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :photo)
  end
end
