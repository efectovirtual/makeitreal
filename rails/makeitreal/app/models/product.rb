class Product < ApplicationRecord
  has_many :orders_products
  has_many :orders, through: :orders_products

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :in_inventory, -> { where('quantity > :qty',  qty: 0) }
  scope :not_expired, -> { where expired: false }
end
