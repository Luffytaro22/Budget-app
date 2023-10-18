require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
	# Request to: /groups/:group_id/purchases
	describe 'GET /index' do
		# The user logged in before run the tests
		before do
			user = FactoryBot.create(:user)
			group = FactoryBot.create(:group, user: user)
			purchase = FactoryBot.create(:purchase, author: user)
			# Add the purchase to the group
			group.purchases << purchase
			sign_in user
			get group_purchases_path(group)
		end

		# test if the response status was correct (status 200)
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # test if a correct template was rendered.
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    # test if the response body includes the correct content.
    it 'renders the index template with the correct content' do
    	expected_result = 'TRANSACTIONS'
    	expect(response.body).to include(expected_result)

    	expected_result_purchase = 'Water'
    	expect(response.body).to include(expected_result_purchase)

    	expected_result_amount = 12.5
    	expect(response.body).to include(expected_result_amount.to_s)
    end
	end

	# request to: /groups/:group_id/purchases/new
	describe 'GET /new' do
		before do
			user = FactoryBot.create(:user)
			group = FactoryBot.create(:group, user: user)
			sign_in user
			get new_group_purchase_path(group)
		end

		# test if the response status was correct (status 200)
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # test if a correct template was rendered.
    it 'renders the index template' do
      expect(response).to render_template(:new)
    end

    # test if the response body includes the correct content.
    it 'renders the index template with the correct content' do
      expected_result = 'TRANSACTION'
      expect(response.body).to include(expected_result)

      expected_result_button = 'ADD'
      expect(response.body).to include(expected_result_button)
    end
	end
end