require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'description attribute' do
    it 'adds a description' do
      p = Product.new(description: "A fun new dev.")
      expect(p.save).to be(true)
    end

    it 'returns a description' do
      p = Product.new(description: "The fun new dev I want.")
      p.save
      expect(Product.find(id=p.id).description).to eq("The fun new dev I want.")
    end
  end

  describe 'price attribute' do
    it 'adds a price' do
      p = Product.new(price: 45)
      expect(p.save).to be(true)
    end

    it 'returns a price' do
      p = Product.new(price: 45)
      p.save
      expect(Product.find(id=p.id).price).to eq(45)
    end
  end
end

