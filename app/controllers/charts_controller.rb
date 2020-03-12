class ChartsController < ApplicationController

  def find_user(offer_line)
    # Returns the id of the producer given a specific offer line
    offer = Offer.find(offer_line.offer_id)
    producer = User.find(offer.from_user_id)
    return producer.id
  end


  def all_products(offer_lines)
    products = offer_lines.flat_map(&:target_offer_line).uniq.map(&:product)
    return products.uniq
  end

  def all_users(offer_lines)
    users = []

    offer_lines.each do |offer_line|
      users << find_user(offer_line)
    end

    return users.uniq!
  end

  def assign_user_points(offer_lines)
    # Takes all the offer lines and returs a hash with all the producers and their respective symbols
    user_points_hash = Hash.new
    point_types = ['circle', 'triangle', 'square', 'diamond', 'star', 'polygon']
    i = 0
    users = all_users(offer_lines)

    users.each do |user|
      user_points_hash[user] = point_types[i]
      i += 1
    end

    return user_points_hash
  end

  def assign_user_colors(offer_lines)
    user_colours_hash = Hash.new
    colors = ['#7d3c98 ', ' #FF5733 ', '#63A74A', '#15A0C8', '#4151A3', '#703593', '#981B48']
    users = all_users(offer_lines)
    i = 0

    users.each do |user|
      user_colours_hash[user] = colors[i]
      i += 1
    end

    return user_colours_hash
  end

  def assign_product_position(offer_lines)
    product_y_position = Hash.new
    products = all_products(offer_lines)
    j = 1
    products.each do |product|
      product_y_position[product.id] = j
      j += 1
    end

    return product_y_position
  end

  def creat_html(offer_line)
    # Produces the HTML that shows in the tooltip
    product = Product.find(offer_line.product_id)
    offer = Offer.find(offer_line.offer_id)
    producer = User.find(offer.from_user_id)

    return "<div style='padding:5px 5px 5px 5px;'><b>#{producer.company_name}</b> <p style='font-weight: normal;'><b>Product</b>: #{product.name}</p> </div>"
  end


  def display_chart
    # The main function of the view, brings everything together
    @offer = Offer.find(params[:id])
    @orgininal_offer = Offer.find(@offer.offer_request_id)
    @received_offers = Offer.where(offer_request_id: @orgininal_offer.id)

    offer_ids = []
    @received_offers.each { |offer| offer_ids << offer.id }
    @offer_lines = OfferLine.where(offer_id: offer_ids)

    @chart_points = []
    user_points = assign_user_points(@offer_lines)
    user_colours = assign_user_colors(@offer_lines)
    product_position = assign_product_position(@offer_lines)


    @offer_lines.each do |offer_line|
      @chart_points << [offer_line.price, product_position[offer_line.target_offer_line.product.id], creat_html(offer_line), "point { size: 13; shape-type: 'circle' ; fill-color: #{user_colours[find_user(offer_line)]}; }"]
    end
  end

end

