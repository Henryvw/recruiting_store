class AddShoppingCartToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :shopping_cart, foreign_key: true
  end
end
