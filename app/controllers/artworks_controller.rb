class ArtworksController < ApplicationController
  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    authorize @artwork
    if @artwork.save
      redirect_to artwork_path(@artwork)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @artwork = Artwork.new
    authorize @artwork
  end

  def index
    @artworks = policy_scope(Artwork)
    @artworks = Artwork.all
  end

  def edit
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.user = current_user
    authorize @artwork
    if @artwork.update(artwork_params)
      redirect_to artwork_path(@artwork)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :price, :shipping_costs, photos: [])
  end
end
