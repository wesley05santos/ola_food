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
    @order = Orders::OrderHandlerService.call(service: Orders::GenerateOrderServiceOld, **order_params_with_customer_id)
    if @order.persisted?
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
    @customers = Customer.all.order(name: :asc)
    @products = Product.all.order(name: :asc)
    @order = Orders::OrderHandlerService.call(service: Orders::UpdateOrderServiceOld, params: , order_params_with_customer_id: )
    if @order.errors.none?
      flash[:notice] = 'Pedido editado com Sucesso!'
      return redirect_to @order

    end
    render :edit
  end

  def destroy
    @order = Order.find(params[:id])
    flash[:notice] = 'Pedido deletado com Sucesso!' if @order.destroy
    redirect_to orders_path
  end
end

private

def order_params
  params.require(:order).permit(:id, :customer_id, product_ids: [])
end

def order_params_with_customer_id
  order_params.tap{ |hash| hash[:customer_id] = Customer.find_by(name: hash[:customer_id])&.id }
end
