require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'user' do
    it 'should be valid' do
      expect(user).to be_valid
    end
  end

  describe 'attributes' do
    it 'User should have a name attribute with a valid value' do
      expect(user.name).to eq('Manuel')
    end

    it 'User should have an email attribute with a valid value' do
      expected_result = "user_#{user.id}@mail.com"

      expect(user.email).to eq(expected_result)
    end

    it 'User should have a valid password' do
      expect(user.password).to eq('password123')
    end
  end
end
