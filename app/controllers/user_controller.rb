class UserController < ApplicationController

  def my_products
    @products = Product.where(user: current_user)
  end

  def index
    @users = User.all

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
