class GenerateOrderService
  def initialize(**args)
    @order_params_with_customer_id = args
    @product_ids = args['product_ids']
  end

  def self.call(**args)
    GenerateOrderService.new(**args).call
  end

  def call
    run
  end

  private

  def run
    @order = Order.new(@order_params_with_customer_id)
    return @order if is_invalid?

    @order.save
    @order
  end

  def is_invalid?
    if @product_ids.blank?
      @order.errors.add(:product_ids, 'Obrigatório selecionar algum item!')
      true
    end
  end
end
