class Order < ApplicationRecord
  belongs_to :customer
  has_many :items, dependent: :destroy
  has_many :products, through: :items

  validates :customer_id, presence: true
end
