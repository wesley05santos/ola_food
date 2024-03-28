class Order < ApplicationRecord
  belongs_to :customer
  has_many :items, dependent: :destroy
  has_many :products, through: :items
  has_one :payment, dependent: :destroy

  validates :customer_id, presence: true

  def total_value
    self.items.joins(:product).pluck('products.price').sum(&:to_f)
  end
end
