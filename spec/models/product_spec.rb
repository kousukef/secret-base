require 'rails_helper'

RSpec.describe Product, type: :model do
  

  it 'is valid with name, description, price, images, seller_id and category_id' do
    product = FactoryBot.build(:product)
    expect(product).to be_valid
  end

  it 'is invalid without name' do
    product = FactoryBot.build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include('を入力してください')
  end

  it 'is invalid without description' do
    product = FactoryBot.build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include('を入力してください')
  end

  it 'is invalid without price' do
    product = FactoryBot.build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include('を入力してください')
  end

  it 'is invalid without images' do
    product = FactoryBot.build(:product, images: nil)
    product.valid?
    expect(product.errors[:images]).to include('を入力してください')
  end

  it 'is invalid without category_id' do
    product = FactoryBot.build(:product, category_id: nil)
    product.valid?
    expect(product.errors[:category]).to include('を入力してください')
  end

  it 'is invalid without seller_id' do
    product = FactoryBot.build(:product, seller_id: nil)
    expect(product).not_to be_valid
  end

  it 'is invalid with name which is longer than 51' do
    product = FactoryBot.build(:product, name: 'a' * 51)
    product.valid?
    expect(product.errors[:name]).to include('は50文字以内で入力してください')
  end

  it 'is invalid with description which is longer than 2001' do
    product = FactoryBot.build(:product, description: 'a' * 2001)
    product.valid?
    expect(product.errors[:description]).to include('は2000文字以内で入力してください')
  end
end
