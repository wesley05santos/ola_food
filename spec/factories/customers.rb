FactoryBot.define do
  factory :customer do
    name { 'Joãozinho da Silva' }
    phone_number { '(16) 98203-9595' }
    address { 'Rua Teste de Sempre' }
    number_of_address { 86 }
    neighborhood { 'Bairro São Paulo' }
  end
end
