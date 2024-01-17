FactoryBot.define do
  factory :item do
    price { "9.99" }
    quantity { "5" }
  
    trait :stand_alone do
      product
      order { FactoryBot.create(:order) }
    end
  end
end