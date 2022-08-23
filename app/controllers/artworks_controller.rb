class ArtworksController < ApplicationController
  def show
    @artwork = Artwork.find(params[:id])
  end

  def create
  end

  def new
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
end
