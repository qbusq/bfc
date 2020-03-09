class UserController < ApplicationController

  def my_products
    @products = Product.where(user: current_user)
  end

  def index
    if params[:search] == nil || params[:search][:prod_input] == "" && params[:search][:location_input] == ""
      @users = User.all
    elsif params[:search][:prod_input] != "" && params[:search][:location_input] == ""

      @users = Product.joins(:user)
                      .where("name ILIKE ? ", "%#{(params[:search][:prod_input])}%")
                      .group_by(&:user)

    elsif params[:search][:location_input] != "" && params[:search][:prod_input] == ""

      @users = User.near(params[:search][:location_input], 20, order: :distance)

    else
      all_users = User.near(params[:search][:location_input], 20, order: :distance)

      products = Product.joins(:user)
                      .where("name ILIKE ? ", "%#{(params[:search][:prod_input])}%")
                      .group_by(&:user)

      @users = products.select{ |user, products| all_users.include?(user)}
    end

    if @users.class == Hash
      @markers = @users.map do |user|
            {
              lat: user[0].latitude,
              lng: user[0].longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { user: user[0] }),
            }
      end
    else
      @markers = @users.map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
