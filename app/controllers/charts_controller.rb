class ChartsController < ApplicationController


  def display_chart
    @offer = Offer.find(params[:id])
    @orgininal_offer = Offer.find(@offer.offer_request_id)
    @received_offers = Offer.where(offer_request_id: @orgininal_offer.id)

    offer_ids = []
    @received_offers.each { |offer| offer_ids << offer.id }

    @offer_lines = OfferLine.where(offer_id: offer_ids)

    @chart_points = []


    @offer_lines.each do |line|
      @chart_points << [line.price, line.target_offer_line_id]
    end

    unique_lines = []


    @chart_points.each do |point|
      unique_lines << point[1]
    end

    unique_lines.uniq!

    best_price = []

    unique_lines.each do |line|
      @price = @chart_points.select { |num| num[1] == line }
      prices = @price.each { || }
      best_price << [Product.find(line).name, @price[0].min]
    end


  end

  def best_price



  end



end
