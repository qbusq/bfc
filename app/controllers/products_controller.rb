class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
  end

  def index
    @products = Product.all
  end

  def update
    @product.update(product_params)
  end

  def edit
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :photo, :description, :prod_category_id, :brand,
      :private_label, :weight_in_kg, :nr_per_sku, :prod_specification_pdf, :user_id)
  end
end
