class Order < ApplicationRecord
  belongs_to :customer
  has_many :items
  has_many :products, through: :items

  validates :customer_id, presence: true
end
