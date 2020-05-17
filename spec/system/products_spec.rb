require 'rails_helper'

describe 'index page', type: :system do
  before do
    user_1 = FactryBot.create(:user, name: 'user_1', email: 'user_1@example.com')
    product_1 = FactryBot.create(:product, name: 'product_1', seller_id: user_1.id)
    user_2 = FactryBot.create(:user, name: 'user_2', email: 'user_2@example.com')
    admin = FactryBot.create(:user, name: 'admin', email: 'admin@example.com', admi: true)
  end
  
  describe 'products'
    it 'has image' do
      expect(page).to have_selector("img[src$='test1.jpeg']")
    end
    
    context 'when not logged in' do
      it 'has link 詳細' do
        expect(page).to have_link '詳細'
        click_on '詳細'
        expect(current_page).to eq new_user_session_path
      end
    end
    
    context 'when logged in as not seller' do
      before do
        visit new_user_session_path
        fill_in 'email', with: 'user_2@example.com'
        fill_in 'password', with: 'password'
        click_on 'ログイン'
      end
      it 'has link 詳細' do
        expect(page).to have_link '詳細'
        click_on '詳細'
        expect(current_page).to eq product_path
      end
    end
    context 'when logged in as seller' do
      before do
        visit new_user_session_path
        fill_in 'email', with: 'user_1@example.com'
        fill_in 'password', with: 'password'
        click_on 'ログイン'
      end
      
      it 'has link 詳細' do
        expect(page).to have_link '詳細'
        click_on '詳細'
        expect(current_page).to eq product_path
      end
      
      it 'has link 編集' do
        expect(page).to have_link '編集'
        click_on '編集'
        expect(current_path).to eq edit_product_path
      end
      
      it 'has link 削除' do
        expect(page).to have_link '削除'
        click_on '削除'
        expect(current_path).to eq product_path
      end
    end
end