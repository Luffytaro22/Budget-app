require 'rails_helper'

describe "Visit the index page of 'groups'", type: :feature do
  # logged in before run the tests
  before do
    id = rand(20_000..30_000)
    email = "user_groups_index#{id}@mailgroups.com"
    user = FactoryBot.create(:user, id:, email:)
    FactoryBot.create(:group, user:)
    login_as(user)
  end

  it 'should display the title of the page' do
    visit groups_path
    expect(page).to have_content 'CATEGORIES'
  end

  it "should display the 'New Category' button" do
    visit groups_path
    expect(page).to have_selector('.add-bottom-form-link', text: 'NEW CATEGORY')
  end

  it 'should display the groups' do
    visit groups_path
    expect(page).to have_selector('.category')
  end

  it 'should display the correct group information' do
    visit groups_path
    within('.category') do
      expect(page).to have_css("img[src='https://live.staticflickr.com/65535/48012754801_260dcc1070.jpg']")
      expect(page).to have_selector('h3', text: 'Food')
    end
  end

  it "Clicking on the 'New Category' button should redirect to groups' new page" do
    visit groups_path
    click_link 'NEW CATEGORY'
    expect(page).to have_current_path(new_group_path)
  end
end
