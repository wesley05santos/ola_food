class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    return redirect_to @customer if @customer.save

    render :new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    return redirect_to @customer if @customer.update(customer_params)

    render :edit
  end

  def destroy
    @customer = Customer.find(params[:id])
    flash[:notice] = 'Cliente Deletado com Sucesso!' if @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:phone_number, :name, :address, :number_of_address, :neighborhood)
  end
end