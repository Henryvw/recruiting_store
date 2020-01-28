class Product < ApplicationRecord
  belongs_to :shopping_cart, optional: true
  has_many :items
end
