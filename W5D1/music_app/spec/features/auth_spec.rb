require 'rails_helper'

RSpec.feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'password', :with => "biscuits"
      click_on "Submit"
    end

    scenario "redirects to bands index page after signup" do
      expect(page).to have_content('Bands')
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      click_on "Submit"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(page).to have_content "New User"
      expect(page).to have_content "Password is too short"
    end
  end

end
