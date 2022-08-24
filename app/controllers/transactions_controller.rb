class TransactionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
    # raise
  end

  def create
    # @transaction = Transaction.new(add the user_id, artwork_id, status)
    @transaction = Transaction.new
    authorize @transaction

    if @transaction.save
      redirect_to transaction_path(@transaction)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
