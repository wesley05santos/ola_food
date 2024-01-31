class Product < ApplicationRecord
  validates :code, :name, :price, presence: true
  has_many :items
  has_many :orders, through: :items
end
