class UserController < ApplicationController

  def my_products
    @products = Product.where(user: current_user)
  end

  def show
    @user = User.find(params[:id])
  end

end
