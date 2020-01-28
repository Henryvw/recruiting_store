require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  let(:my_cart) { FactoryBot.create(:shopping_cart) }
  let(:my_first_product) { FactoryBot.create(:product) }
  let(:products) { my_cart.products }

  describe 'Basics' do
    it 'returns itself' do
      new_cart = ShoppingCart.new(
        products: [my_first_product]
      )
      binding.pry
      new_cart.save
      expect(ShoppingCart.all).to include(new_cart)
    end

    it 'has a working factory' do
      expect(my_cart).to be_valid
    end

    it 'successfully fetches associated products added to the cart' do
      new_cart = ShoppingCart.new(
        products: [my_first_product]
      )

      actual_cart_products = new_cart.products
      expected_products = [my_first_product]

      expect(actual_cart_products).to eq(expected_products)
    end
  end
end
