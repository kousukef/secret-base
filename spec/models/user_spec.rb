require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) {FactoryBot.build(:user)}
    
  describe 'validattion' do
      it 'should be invalid without user name' do
        user.name = ''
        user.valid?
        expect(user.errors.messages[:name]).to include('名前が入力されていません')
      end
  end
end
