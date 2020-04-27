FactoryBot.define do
  factory :product do
    name { "test product" }
    description { "this is test" }
    price { 100 }
    product_image { "default.png" }
  end
end
