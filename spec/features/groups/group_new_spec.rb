require 'rails_helper'

describe "Visit the new page of 'groups'", type: :feature do
  # logged in before run the tests
  before do
    id = rand(20_000..30_000)
    email = "user_groups_new#{id}@mailgroups.com"
    user = FactoryBot.create(:user, id:, email:)
    FactoryBot.create(:group, user:)
    login_as(user)
  end

  it 'should display the title of the page' do
    visit new_group_path
    expect(page).to have_content 'CATEGORY'
  end

  it 'should display a form with the fields to create a group' do
    visit new_group_path
    expect(page).to have_selector('form')
    expect(page).to have_css('input[type="text"]')
    expect(page).to have_css('input[type="radio"]')
  end

  it 'should have a button to submit the form and a back icon' do
    visit new_group_path
    expect(page).to have_css('input[type="submit"]')
    expect(page).to have_selector('.fa-solid.fa-arrow-left')
  end

  it 'Clicking on the submit button should send the form and create a new group' do
    visit new_group_path

    within('form') do
      fill_in 'group[name]', with: 'Clothes'
    end

    find('input[value="https://m.media-amazon.com/images/I/61M3SN0s6vL._AC_UF894,1000_QL80_.jpg"]').click

    click_button 'ADD'
    expect(page).to have_current_path(groups_path)
    expect(page).to have_content 'The Category was created successfully!'
  end
end
