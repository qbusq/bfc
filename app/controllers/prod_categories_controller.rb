class ProdCategoriesController < ApplicationController
  def new
    @prod_category = ProdCategory.new
  end

  def index
    @prod_categories = ProdCategory.all

  end

  def create
    @prod_category = ProdCategory.new(prod_category_params)
    @prod_category.save
  end

  def destroy
    @prod_category = ProdCategory.find(params[:id])
    @prod_category.destroy
  end

  private

  def prod_category_params
    params.require(:prod_category).permit(:name, :gpc_brick, :brick_description)
  end
end
