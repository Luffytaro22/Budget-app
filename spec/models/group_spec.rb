require 'rails_helper'

RSpec.describe Group, type: :model do
	let(:group) { create(:group) }
	let(:purchase) { create(:purchase) }

	describe 'group' do
		it 'should be valid' do
			expect(group).to be_valid
		end

		it "should be called 'Food'" do
			expect(group.name).to eq('Food')
		end
	end

	describe 'attributes validation' do
		it 'The Group should not be valid without a name' do
			group.name = nil

			expect(group).to_not be_valid
		end

		it 'The Group should not be valid if the name has more than 20 characters' do
			group.name = 'a' * 21

			expect(group).to_not be_valid
		end

		it 'The Group should not be valid without an icon' do
			group.icon = nil

			expect(group).to_not be_valid
		end
	end

	describe 'Methods results' do
		it 'The sum_amount method should calculate the right value' do
			group.purchases << purchase
			expect(group.sum_amount).to eq(12.5)
		end
	end
end