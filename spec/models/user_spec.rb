require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) {FactoryBot.build(:user)}
    
  describe 'validattion' do
      it 'should be invalid without user name' do
        user.name = ''
        expect(user).not_to be_valid?
      end
      
  end
end
