FactoryBot.define do
  factory :product do
    name {'product_1'}
    description {'this is a product'}
    price {3000}
    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
    association :seller
    association :category
  end
end
