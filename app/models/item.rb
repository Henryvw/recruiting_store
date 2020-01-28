class Item < ApplicationRecord
  belongs_to :shopping_cart, optional: true
  belongs_to :product, optional: true
end
