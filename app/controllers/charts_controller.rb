class ChartsController < ApplicationController


  def display_chart
    @offers = current_user.offers.to_json

  end





end
