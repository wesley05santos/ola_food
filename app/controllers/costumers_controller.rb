class CostumersController < ApplicationController
  def index
    @costumers = Costumer.all
  end

  def show
    @costumer = Costumer.find(params[:id])
  end

  def new
    @costumer = Costumer.new
  end

  def create
    @costumer = Costumer.new(costumer_params)
    return redirect_to @costumer if @costumer.save

    render :new
  end

  def edit
    @costumer = Costumer.find(params[:id])
  end

  def update
    @costumer = Costumer.find(params[:id])
    return redirect_to @costumer if @costumer.update(costumer_params)

    render :edit
  end

  def destroy
    @costumer = Costumer.find(params[:id])
    flash[:notice] = 'Cliente Deletado com Sucesso!' if @costumer.destroy
    redirect_to costumers_path
  end

  private

  def costumer_params
    params.require(:costumer).permit(:phone_number, :name, :address, :number_of_address, :neighborhood)
  end
end