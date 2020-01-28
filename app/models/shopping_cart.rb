class ShoppingCart < ApplicationRecord
  has_many :products
  has_many :items, through: :products
  def add_item(product)
    self.products << product
  end

  def find_total_cost
    all_product_prices = self.products.pluck(:price)
    total_cost = all_product_prices.inject(0) do |sum, next_price|
      sum + next_price
    end
    total_cost
  end
end
