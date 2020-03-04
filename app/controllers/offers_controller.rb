class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :destroy]

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def show
  end

  def index
    Offer.all
  end

  def destroy
    @offer.destroy
  end

  private

  def offer_params
    params.require(:offers).permit(:from_user, :to_user, :date, :start_date, :end_date, :status)

  end

  def find_offer
    @offer = Offer.find(params[:id])
  end

end

