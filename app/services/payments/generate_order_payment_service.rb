class Payments::GenerateOrderPaymentService
  def initialize(**args)
    binding.break
    @user_id = args[:user_id]
    @order = Order.find(args[:order_id])
  end

  def self.call(**args)
    new(**args).call
  end

  def call
    run
  end

  private

  def run
    Payment.create(hash_data)
  end

  def hash_data
    Time.zone = 'America/Sao_Paulo'
    @hash_data = {
      user_id: @user_id,
      order_id: @order.id,
      date_of_payment: Time.zone.now
    }
  end
end

