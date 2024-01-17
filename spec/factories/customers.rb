FactoryBot.define do
  factory :customer do
    name { 'Joãozinho da Silva' }
    phone_number { '(16) 98203-9595' }
    address { 'Rua Teste de Sempre' }
    number_of_address { 86 }
    neighborhood { 'Bairro São Paulo' }

    trait :second_customer do
      name { 'Wesley Machado dos Santos' }
      phone_number { '(16) 99999-9999' }
      address { 'Rua Teste Geral' }
      number_of_address { 555 }
      neighborhood { 'Bairro RJ' }
    end
  end
end
