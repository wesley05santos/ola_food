class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(id: :desc)
  end

  def new
    @customers = Customer.all.order(name: :asc)
    @products = Product.all.order(name: :asc)
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params_with_customer_id)
    if @order.save
      flash[:notice] = 'Pedido confirmado com Sucesso!' 
      return redirect_to @order

    end
    @customers = Customer.all.order(name: :asc)
    @products = Product.all.order(name: :asc)
    render :new    
  end

  def edit
    @order = Order.find(params[:id])
    @customers = Customer.all.order(name: :asc)
    @products = Product.all.order(name: :asc)
  end

  def update
    @order = Order.find(params[:id])
    @customers = Customer.all.order(name: :asc)
    @products = Product.all.order(name: :asc)
    return redirect_to orders_path if @order.update(order_params_with_customer_id)

    render :edit
  end
end

private

def order_params
  params.require(:order).permit(:customer_id, product_ids: [])
end

def order_params_with_customer_id
  order_params.tap{ |hash| hash[:customer_id] = Customer.find_by(name: hash[:customer_id])&.id }
end