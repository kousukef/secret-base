require 'rails_helper'

RSpec.describe Product, type: :model do
  #userとuserに関連付けたpuroductを作成
  let(:user) {FactoryBot.create(:user)}
  let(:product) {user.products.build(FactoryBot.attributes_for(:product))}
  
  describe 'validations' do
    it 'is invalid without name' do
      product.name = ''
      expect(product).not_to be_valid?
    end
    
    it 'is invalid without description' do
      product.description = ''
      expect(product).not_to be_valid?
    end
    
    it 'is invalid without price' do
      product.price = nil
      expect(product).not_to be_valid?
    end
    
    it 'is invalid without product_image' do
      product.product_image = ''
      expect(product).not_to be_valid?
    end
  end
end
