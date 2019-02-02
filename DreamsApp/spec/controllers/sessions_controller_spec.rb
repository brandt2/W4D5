require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  feature "logging in" do
    scenario "shows username on the homepage after login" do
      visit new_session_url
      save_and_open_page
      visit new_user_path
      input_user = FactoryBot.build(:user)
      fill_in "Password:", with: input_user.password
      fill_in "Username:", with: input_user.username
      click_button "Sign Up"

      fill_in "Password:", with: input_user.password
      fill_in "Username:", with: input_user.username
      click_button "Log In"
    end
  end
end
