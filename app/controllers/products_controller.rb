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
    return redirect_to @product if @product.save

    render :new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    return redirect_to @product if @product.update(product_params_fixed)

    render :edit
  end

  def destroy
    @product = Product.find(params[:id])
    flash[:notice] = 'Produto Deletado com Sucesso!' if @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:code, :name, :price)
  end

  def product_params_fixed
    product_params.tap{ |hash| hash[:price] = hash[:price].gsub(',','.') if hash[:price] }
  end
end