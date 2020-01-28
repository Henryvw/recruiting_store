class ShoppingCart < ApplicationRecord
  has_many :products
  has_many :items, through: :products
  def add_item(product)
    self.products << product
  end
end
