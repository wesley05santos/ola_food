class UpdateOrderService
  def initialize(**args)
    @params = args[:params]
    @order_params_with_customer_id = args[:order_params_with_customer_id]
    @product_ids = args[:order_params_with_customer_id]['product_ids']
  end

  def self.call(**args)
    UpdateOrderService.new(**args).call
  end

  def call
    run
  end

  private

  def run
    @order = Order.find(@params[:id])
    return @order if is_invalid?

    @order.update(@order_params_with_customer_id)
    @order
  end

  def is_invalid?
    if @product_ids.blank?
      @order.errors.add(:product_ids, 'Obrigatório selecionar algum item!')
      true
    end
  end
end
