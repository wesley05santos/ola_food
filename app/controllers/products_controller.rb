class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params_fixed)
    return redirect_to product_path(@product.id) if @product.save

    render :new
  end

  private

  def product_params
    params.require(:product).permit(:code, :name, :price)
  end

  def product_params_fixed
    product_params.tap{ |hash| hash[:price] = hash[:price].gsub(',','.') if hash[:price] }
  end
end