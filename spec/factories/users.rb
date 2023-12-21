FactoryBot.define do
  factory :user do
    email { 'teste@olafood.com' }
    password { 'abc123' }

    trait :confirmed do
      confirmed_at { DateTime.now }
    end
  end
end
