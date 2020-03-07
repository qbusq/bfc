class OfferLinesController < ApplicationController
  before_action :offer_line_find, only: [:show, :edit, :update, :destroy]

  def new
    @offer = Offer.find(params[:offer_id])
    @offer_line = OfferLine.new
  end

  def create
    @offer_line = OfferLine.new(offer_line_params)
    @offer = Offer.find(params[:offer_id])
    @offer_line.offer = @offer
    if @offer_line.save
      redirect_to new_offer_offer_line_path(@offer)
    else
      render :new
    end
  end

  def index
    @offer_lines = OfferLine.all
  end

  def destroy
    @offer_line.destroy
  end


  private

  def offer_line_find
    @offer_line = OfferLine.find(params[:id])
  end

  def offer_line_params
    params.require(:offer_line).permit(:offer, :product, :quantity_in_tons, :price, :target_offer_line, :alternative_to_target )
  end

end
