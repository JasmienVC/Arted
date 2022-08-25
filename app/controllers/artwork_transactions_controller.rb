class ArtworkTransactionsController < ApplicationController
  def show
    @transaction = ArtworkTransaction.find(params[:id])
    authorize @transaction
    @artwork = Artwork.find(params["artwork_id"])
    authorize @artwork
  end

  def create
    # gets triggered, when you click "buy this artwork"
    # makes a new transaction with status = 0 (pending)


    @transaction = ArtworkTransaction.new
    authorize @transaction

    # finds the artwork via the artwork_id params
    artwork = Artwork.find(params[:artwork_id])
    authorize artwork

    # adds artwork and user to the transaction
    @transaction.artwork = artwork
    @transaction.user = current_user

    if @transaction.save
      artwork.artwork_transaction.paid!
      authorize artwork
      # redirects to the artwork transaction show page
      redirect_to artwork_artwork_transaction_path(artwork, @transaction), notice: "Order placed", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm_transaction
    # raise
    # gets triggered when you click "confirm purchase" on the artwork_transaction show page
    artwork = Artwork.find(params[:id])
    # sets the status, to paid (enum 1)
    artwork.artwork_transaction.paid!
    authorize artwork
    if artwork.artwork_transaction.save
      # redirects to the artworks index page, shows npotification
      redirect_to artworks_path, notice: "Your Artwork will be shipped tomorrow"
    else
      render "show", status: :unprocessable_entity
    end
  end
end
