require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe 'sign up' do
    scenario 'successed' do
      expect {
        visit new_user_registration_path
        fill_in '名前', with: 'user_1'
        fill_in 'メールアドレス', with: 'user_1@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認のためもう一度お願いします', with: 'password'
        attach_file 'user_avatar', "#{Rails.root}/spec/fixtures/test.jpeg"
        click_on 'Sign up'

        expect(page).to have_current_path root_path
        expect(page).to have_selector '.alert-primary', text: 'アカウント登録が完了しました。'
      }.to change(User.all, :count).by(1)
    end

    scenario 'faluer becouse of blank' do
      expect{
        visit new_user_registration_path
        fill_in 'メールアドレス', with: 'user_1@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認のためもう一度お願いします', with: 'password'
        attach_file 'user_avatar', "#{Rails.root}/spec/fixtures/test.jpeg"
        click_on 'Sign up'

        expect(page).to have_selector 'li', text: '名前を入力してください'
        expect(find_field('メールアドレス').value).to eq 'user_1@example.com'
      }.to change(User.all, :count).by(0)
    end

    scenario 'faluer becouse email is not unique' do
      FactoryBot.create(:user, email: 'user_1@example.com')
      expect{
        visit new_user_registration_path
        fill_in '名前', with: 'user_1'
        fill_in 'メールアドレス', with: 'user_1@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認のためもう一度お願いします', with: 'password'
        attach_file 'user_avatar', "#{Rails.root}/spec/fixtures/test.jpeg"
        click_on 'Sign up'

        expect(page).to have_selector 'li', text: 'メールアドレスはすでに存在します'
        expect(find_field('名前').value).to eq 'user_1'
        expect(find_field('メールアドレス').value).to eq 'user_1@example.com'
      }.to change(User.all, :count).by(0)
    end
  end
end
