FactoryBot.define do
  factory :product do
    description { 'A new developer with new experiences' }
    sequence(:unique_product_id)
    price { 33 }
  end
end
