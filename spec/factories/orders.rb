FactoryBot.define do
  factory :order do
    customer
    
    trait :stand_alone do
      items { |method| [ method.association(:item, :stand_alone, order: instance) ] }
    end
  end
end