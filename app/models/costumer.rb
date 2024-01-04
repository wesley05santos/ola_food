class Costumer < ApplicationRecord
  validates :phone_number, :name, :address, :number_of_address, :neighborhood, presence: true
end
