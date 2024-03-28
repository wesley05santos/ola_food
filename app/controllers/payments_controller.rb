class PaymentsController < ApplicationController
  def new
    @order_id = params[:order_id]
    @order = Order.find(params[:order_id])
    @payment = Payment.new
  end

  def create
    @order = Order.find(params[:order_id])
    return redirect_to order_path(@order) if @order.payment.present?

    @payment = Payments::GenerateOrderPaymentService.call(user_id: current_user.id, order_id: params[:order_id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: (@order.total_value.round(2) * 100).to_i,
      description: 'OlaFood',
      currency: 'brl'
    })
    redirect_to order_path(@order) if @order.update(paid: charge[:paid])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end
end
