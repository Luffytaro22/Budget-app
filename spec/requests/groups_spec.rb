require 'rails_helper'

RSpec.describe 'Groups', type: :request do
	# Request to: /groups
	describe 'GET /index' do
		# The user logged in before run the tests
		before do
			user = FactoryBot.create(:user)
			FactoryBot.create(:group, user: user)
			sign_in user
			get groups_path
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
    	expected_result = 'CATEGORIES'
    	expect(response.body).to include(expected_result)

    	expected_result_group = 'Food'
    	expect(response.body).to include(expected_result_group)
    end
	end

	# request to: /groups/new
	describe 'GET /new' do
		before do
			user = FactoryBot.create(:user)
			sign_in user
			get new_group_path
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
      expected_result = 'CATEGORY'
      expect(response.body).to include(expected_result)

      expected_result_button = 'ADD'
      expect(response.body).to include(expected_result_button)
    end
	end
end