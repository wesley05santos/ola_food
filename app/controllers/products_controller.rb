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
    @product = Product.new(code: params[:product][:code],
                name: params[:product][:name],
                price: params[:product][:price]
    )

    if @product.save
      return redirect_to product_path(@product.id)

    end
    render :new
  end
end