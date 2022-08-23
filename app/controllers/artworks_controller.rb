class ArtworksController < ApplicationController
  def show
    @artwork = Artwork.find(params[:id])
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to artwork_path(@artwork)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @artwork = Artwork.new
  end

  def index
    @artworks = Artwork.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def artwork_params
    params.require(:article).permit(:title, :description, :photo, :price, :shipping_costs)
  end
end
