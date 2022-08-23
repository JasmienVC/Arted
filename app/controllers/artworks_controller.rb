class ArtworksController < ApplicationController
  def show
    authorize @artwork
    @artwork = Artwork.find(params[:id])
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
    @artworks = Artwork.all
  end

  def edit
    authorize @artwork
  end

  def update
    authorize @artwork
  end

  def destroy
    authorize @artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :price, :shipping_costs, photos: [])
  end
end
