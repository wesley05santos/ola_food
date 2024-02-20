class Orders::OrderHandlerService
  def initialize(**args)
    @args = args
    @service = args[:service]
    @args.delete(:service)
  end

  def self.call(**args)
    new(**args).call
  end

  def call
    run
  end

  private

  def run
    @service.call(**@args)
  end
end
