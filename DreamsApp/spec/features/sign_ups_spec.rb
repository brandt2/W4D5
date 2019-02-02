require "spec_helper"
require "rails_helper"

RSpec.feature "SignUps", type: :feature do
  background(:each) { visit new_user_path }

  scenario "has a user sign up page" do
    visit new_user_url
    expect(page).to have_content("Sign Up")
  end

  scenario "it takes a password and username" do
    input_user = FactoryBot.build(:user)
    fill_in "Password:", with: input_user.password
    fill_in "Username:", with: input_user.username

    click_button "Sign Up"

    expect(current_url).to eq(user_url(User.last))
    expect(page).to have_content(input_user.username)
    # save_and_open_page
  end
end

feature "logging in" do
  scenario "shows username on the homepage after login" do
    visit new_user_path
    input_user = FactoryBot.build(:user)
    fill_in "Password:", with: input_user.password
    fill_in "Username:", with: input_user.username
    click_button "Sign Up"

    visit new_session_url
    fill_in "Password:", with: input_user.password
    fill_in "Username:", with: input_user.username
    click_button "Sign Up"
  end
end
