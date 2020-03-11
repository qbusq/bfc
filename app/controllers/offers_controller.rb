class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to offers_requested_offers_path
    else
      render :new
    end
  end

  def new_offer
    old_offer = Offer.find(params[:offer_id])
    @offer = old_offer.deep_clone include: :offer_lines
    @offer.from_user = old_offer.to_user
    @offer.to_user = old_offer.from_user
    @offer.title = "Re: " + old_offer.title
    if old_offer.status == 'requested'
      @offer.offer_request_id = old_offer.id
    else
      @offer.offer_request_id = old_offer.offer_request_id
    end
    @offer.follow_up_on_offer_id = old_offer.id

  end

  def create_offer
    @offer = Offer.new(offer_params.except(:offer_lines_attributes))
    @offer_line = OfferLine.new(params[:offer][:offer_line])
    @offer_line.save
    @offer.offer_line = @offer_line

    if @offer.save
      if @offer.status == 'confirmed'
        redirect_to contracts_offers_path
      else
        redirect_to offer_path(@offer)
      end
    else
      render :new_offer
    end
  end


  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to offers_received_offers_path
    else
      render :edit
    end
  end

  def show
    @offer_line = OfferLine.new
  end

  def index
   @offers = current_user.offers
  end

  def offers_requested #status "requested"
    @offers = Offer.where(from_user_id: current_user.id).where(status: "requested")
    @all_offers = Offer.all
  end

  def offers_received #status "sent"
    @offers = Offer.where(to_user_id: current_user.id).where(status: "sent")
    @accepted_offers = Offer.where(to_user_id: current_user.id).where(status: "accepted")
    @spontaneous_offers = Offer.where(to_user_id: current_user.id).where(offer_request_id: nil)
    # @requested_offers = Offer.where(to_user_id: current_user.id).where(offer_request_id: != nil)
  end

  def contracts #status "confirmed"
    @offers = Offer.where(to_user_id: current_user.id).where(status: "confirmed")
  end

  def destroy
    @offer.destroy
  end


  private

  def offer_params
    params.require(:offer)
      .permit(:from_user_id, :to_user_id, :title, :date, :deadline, :country, :start_date, :end_date, :remark, :offer_request_id, :follow_up_on_offer_id, :status,
        offer_lines_attributes: [:offer_id, :product_id, :quantity_in_tons, :price, :target_offer_line_id, :alternative_to_target ]
      )
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end

end

