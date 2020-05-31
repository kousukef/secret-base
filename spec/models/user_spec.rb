require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email and password ' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
    
  it 'is invalid without name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it 'is invalid without email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'is invalid without password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  
  it 'is invalid with a dupulicate email' do
    user_1 = FactoryBot.create(:user, email: 'example@example.com')
    user_2= FactoryBot.build(:user, email: 'example@example.com')
    user_2.valid?
    expect(user_2.errors[:email]).to include('はすでに存在します')
  end


end
