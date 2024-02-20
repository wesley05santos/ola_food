class Orders::GenerateOrUpdateOrderService
  def initialize(**args)
    @params = args[:params]
    @order_params_with_customer_id = args
    @customer_id = args['customer_id']
    @product_ids = args['product_ids']
  end

  def self.call(**args)
    new(**args).call
  end

  def call
    run
  end

  private

  def run
    if @params.blank?
      @order = Order.new(@order_params_with_customer_id)
      return @order if is_invalid?

      @order.save
      @order
    else
      @order = Order.find(@params[:id])
      return @order if is_invalid?

      @order.update(customer_id:@customer_id, product_ids: @product_ids)
      @order
    end
  end

  def is_invalid?
    if @product_ids.blank?
      @order.errors.add(:product_ids, 'Obrigatório selecionar algum item!')
      true
    end
  end
end
