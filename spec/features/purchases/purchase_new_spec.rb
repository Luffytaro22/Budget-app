require 'rails_helper'

describe "Visit the new page of 'purchases'", type: :feature do
	# logged in before run the tests
  before do
    id = rand(20_000..30_000)
    email = "user_groups_index#{id}@mailgroups.com"
    user = FactoryBot.create(:user, id:, email:)
    @group = FactoryBot.create(:group, user:)
    @purchase = FactoryBot.create(:purchase, author: user)
    @group.purchases << @purchase
    login_as(user)
  end

  it 'should display the title of the page' do
  	visit new_group_purchase_path(@group)
  	expect(page).to have_content 'TRANSACTION'
  end

  it 'should display a form with the fields to create a purchase' do
  	visit new_group_purchase_path(@group)
  	expect(page).to have_selector('form')
  	expect(page).to have_css('input[type="text"]')
  	expect(page).to have_css('input[type="number"]')
  	expect(page).to have_selector('select')
  end

  it 'should have a button to submit the form and a back icon' do
  	visit new_group_purchase_path(@group)
  	expect(page).to have_css('input[type="submit"]')
    expect(page).to have_selector('.fa-solid.fa-arrow-left')
  end

  it 'Clicking on the submit button should send the form and create a new purchase' do
		visit new_group_purchase_path(@group)
		within('form') do
			fill_in 'purchase[name]', with: 'Meat'
			fill_in 'purchase[amount]', with: 6.25
		end

		page.select 'Food', from: 'purchase[group]'

		click_button 'ADD'
		expect(page).to have_current_path(group_purchases_path(@group))
		expect(page).to have_content('The Transaction was created successfully!')
  end
end