class Order < ApplicationRecord
  belongs_to :costumer
  has_many :items
  has_many :products, through: :items
end
