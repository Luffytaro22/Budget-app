require 'rails_helper'

describe "Visit the index page of 'purchases'", type: :feature do
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
  	visit group_purchases_path(@group)
  	expect(page).to have_content 'TRANSACTIONS'
  end

  it "should display the 'New Transaction' button" do
  	visit group_purchases_path(@group)
  	expect(page).to have_selector('.add-bottom-form-link', text: 'NEW TRANSACTION')
  end

  it 'should display the transactions' do
  	visit group_purchases_path(@group)
  	expect(page).to have_selector('.category')
  end

  it 'should display the correct transaction information' do
  	visit group_purchases_path(@group)
  	within('.category') do
  		expect(page).to have_css("img[src='https://live.staticflickr.com/65535/48012754801_260dcc1070.jpg']")
  		expect(page).to have_selector('h3', text: 'Water')
  		expect(page).to have_selector('strong', text: 12.5)
  	end
  end

  it 'should display the total amount of transactions' do
  	visit group_purchases_path(@group)
  	total_amount = @group.sum_amount
  	within('.total-amount') do
  		expect(page).to have_selector('strong', text: total_amount)
  	end
  end

  it "Clicking on the 'New Transaction' button should redirect to transaction's new page" do
  	visit group_purchases_path(@group)
  	click_link 'NEW TRANSACTION'
  	expect(page).to have_current_path(new_group_purchase_path(@group))
  end
end