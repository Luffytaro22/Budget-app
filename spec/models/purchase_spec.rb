require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:purchase) { create(:purchase) }

  describe 'purchase' do
    it 'should be valid' do
      expect(purchase).to be_valid
    end

    it "should be called 'Water'" do
      expect(purchase.name).to eq('Water')
    end
  end

  describe 'attributes validation' do
    it 'The Purchase should not be valid without a name' do
      purchase.name = nil

      expect(purchase).to_not be_valid
    end

    it 'The Purchase should not be valid if the name has more than 30 characters' do
      purchase.name = 'a' * 31

      expect(purchase).to_not be_valid
    end

    it 'The Purchase should not be valid without an amount' do
      purchase.amount = nil

      expect(purchase).to_not be_valid
    end

    it 'The Purchase should not be valid if the amount is negative' do
      purchase.amount = -12

      expect(purchase).to_not be_valid
    end
  end
end
