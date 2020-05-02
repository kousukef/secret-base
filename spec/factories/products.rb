FactoryBot.define do
  factory :product do
    name { "test product" }
    description { "this is test" }
    price { 100 }
    product_image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.png')) }
  end
end
