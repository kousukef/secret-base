require 'rails_helper'

describe 'header', type: :system do
  
   before do
    user_1 = FactryBot.create(:user, name: 'user_1', email: 'user_1@example.com')
    product_1 = FactryBot.create(:product, name: 'product_1', seller_id: user_1.id)
  end
    
  it 'has link Home' do
    expect(page).to have_link 'Home'
  end
      
  it 'has link to Products' do
    click_on '商品'
    expect(page).to have_link '全て'
    expect(page).to have_link '本'
    expect(page).to have_link 'メンズ'
    expect(page).to have_link 'レディース'
    expect(page).to have_link 'ガジェット'
    expect(page).to have_link 'その他'
    expect(page).to have_link '出品'
  end
  
  context 'when user logged in' do
    before 'log in' do
      visit new_user_session_path
      fill_in 'email', with: 'user_1@example.com'
      fill_in 'password', with: 'password'
      click_on 'ログイン'
    end
    
    it 'has link User' do
      click_on 'User'
      expect(page).to have_link "#{user_1.name}"
      expect(page).to have_link 'サインアウト'
    end
  end
  
  context 'when user loged in' do
    it 'has link User' do
      click_on 'User'
      expect(page).to have_link "サインイン"
      expect(page).to have_link 'サインアップ'
    end
  end
end