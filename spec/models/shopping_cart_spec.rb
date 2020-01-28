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

  describe '#add_item' do
    it 'adds a product item to the cart' do
      expect { my_cart.add_item(my_first_product) }.to change(my_cart.products, :count).by(1)
    end
  end

  describe '#find_total_cost' do
    it 'returns the cost of a product' do
      new_product = Product.new(price: 66)
      new_product.save
      new_cart = ShoppingCart.new(
        products: [new_product]
      )
      new_cart.save
      expect((new_cart.products.find(id=new_product.id)).price).to eq(new_product.price)
    end

    it 'sums the cost of multiple products of the same type' do
      first_ten_buck_watch = Product.new(description: "Watch", price: 10)
      second_ten_buck_watch = Product.new(description: "Watch", price: 10)
      new_cart = ShoppingCart.new(
        products: [first_ten_buck_watch, second_ten_buck_watch]
      )
      new_cart.save
      expect(new_cart.find_total_cost).to eq(20)
    end

    it 'calculates the cost of multiple products of different types' do
      first_ten_buck_watch = Product.new(description: "Watch", price: 10)
      an_iphone = Product.new(description: "Iphone", price: 30)
      second_ten_buck_watch = Product.new(description: "Watch", price: 10)
 
      new_cart = ShoppingCart.new(
        products: [first_ten_buck_watch, an_iphone, second_ten_buck_watch]
      )
      new_cart.save
      expect(new_cart.find_total_cost).to eq(50)
    end
  end 
end
