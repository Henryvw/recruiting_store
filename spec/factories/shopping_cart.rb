FactoryBot.define do
  factory :shopping_cart do
  end

  trait :product do
    after(:build) do |shopping_cart|
      shopping_cart.products << create(:product)
    end
  end
end
