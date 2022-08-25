class ArtworksController < ApplicationController
  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    # raise
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
    if params[:query].present?
      @artworks = Artwork.artwork_artist_search(params[:query])
      @profiles = @artworks.map{ |art| art.user.profile }
    else
      @artworks = Artwork.all
    end
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
    @artwork = Artwork.find(params[:id])
    authorize @artwork
    @artwork.destroy
    redirect_to artworks_path, status: :see_other
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :price, :shipping_costs, photos: [])
  end
end
