FactoryBot.define do
  factory :item do
    product    
    order { association :product, item: instance, order: order  }
    price { "9.99" }
    quantity { "5" }
  end
end
