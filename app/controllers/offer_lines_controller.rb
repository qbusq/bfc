class OfferLinesController < ApplicationController
  def new
    OfferLine.new
  end

  def create
    @offer_line = OfferLine.new()
    if @offer_line.save
      @offer_line.save
    else
      render :new
    end
  end

  def index
    @offer_line = OfferLine.all
  end

  def destroy
    @offer_line = OfferLine.find(params[:id])
    @offer_line.destroy
  end

  private

  def offer_lines_params
    params.require(:offer_lines).permit(:quantity_in_tons, :full_truck_price_per_kg)
  end


end
