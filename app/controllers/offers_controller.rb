class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :destroy]

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save!

    if @offer.save
      if @offer.status = 'requested'
        @offer.create_offer_lines!
        redirect_to offers_requested_offers_path
      elsif @offer.status = 'confirmed'
        redirect_to contracts_offers_path
      else
        redirect_to offer_path(@offer)
      end
    else
      render :new
    end
  end

  def show

  end

  def index
   @offers = Offer.all
  end

  def offers_requested #status "requested"
    @offers = Offer.where(status: "requested")
  end

  def offers_received #status "pending"
    @offers = Offer.where(status: "pending")
  end

  def contracts #status "confirmed"
    @offers = Offer.where(status: "confirmed")
  end

  def destroy
    @offer.destroy
  end


  private

  def offer_params
    params.require(:offer).permit(:from_user_id, :to_user_id, :title, :date, :start_date, :end_date, :remark, :offer_request_id, :follow_up_on_offer_id, :status)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end

end

