require 'rails_helper'

RSpec.feature "Products", type: :feature do
  describe 'user create a new product' do
    before do
      FactoryBot.create(:category)
    end
    describe 'logged in' do
      scenario 'successed' do
        user = FactoryBot.create(:user)

        visit new_user_session_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'

        expect {
          click_on '商品'
          click_link '出品する'
          expect(page).to have_current_path '/products/new'
          
          fill_in '商品名', with: 'product'
          fill_in '説明', with: 'this is a product'
          fill_in '価格', with: '3000'
          attach_file 'product_images', "#{Rails.root}/spec/fixtures/test.jpeg"
          select 'category', from: 'select-first'
          click_button 'submit'

          expect(page).to have_current_path '/products'
          expect(page).to have_selector('.alert-primary', text: '作成に成功')
          expect(page).to have_selector('.card-title', text: 'product')
          expect(page).to have_selector('.card-text', text: '¥ 3,000')
          
        }.to change(user.sales_products, :count).by(1)
      end

      scenario 'falure' do
        user = FactoryBot.create(:user)

        visit new_user_session_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'

        expect {
          click_on '商品'
          click_link '出品する'
          expect(page).to have_current_path '/products/new'
          
          fill_in '説明', with: 'this is a product'
          fill_in '価格', with: '3000'
          attach_file 'product_images', "#{Rails.root}/spec/fixtures/test.jpeg"
          select 'category', from: 'select-first'
          click_button 'submit'

          expect(page).to have_selector 'li', text: '商品名を入力してください'
          expect(find_field('説明').value).to eq 'this is a product'
          expect(find_field('価格').value).to eq '3000'
          
        }.to change(user.sales_products, :count).by(0)
      end

      describe 'not logged in' do
        it 'is rendered to login page' do
          visit products_path
          click_on '商品'
          click_link '出品する'
          
          expect(page).to have_selector '.alert-danger', text: 'アカウント登録もしくはログインしてください。'
          expect(page).to have_selector 'h2', text: 'ログイン'
        end
      end
    end
  end

  describe 'user buy a product', skip: true do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
    end

    scenario 'user buy a product successfully' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'

      click_on '詳細'
      expect(page).to have_current_path "/product/#{product.id}/show"
      expect(page).to have_content "#{product.name}"
      expect(page).to have_content "#{product.description}"
      expect(page).to have_content "¥ #{product.price.to_s(:delimited)}"

      click_on '購入に進む'
      expect(page).to have_content "#{product.name}"
      expect(page).to have_content "¥ #{product.price.to_s(:delimited)}"

      click_on '購入'
      expect(page).to have_current_path "/product/#{product.id}/speak?message_type=after_purchased"
    end
  end

  describe 'comment', skip: true do 
    before do 
      FactoryBot.create(:user)
      FactoryBot.create(:product)
    end

    scenario 'user write a comment', js: true do
      visit root_path
      click_on '詳細'
      click_on '質問をする'
      
      expect{
        fill_in 'hallo!'
        click_on '送信'

        expect(page).to have_selector '.card-text', text: 'hello'
      }.to change(Message.all, :count).by(1)
    end
  end
end
