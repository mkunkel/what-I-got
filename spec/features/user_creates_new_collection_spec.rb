require 'spec_helper'

feature "User adds collection" do
  background do
    User.create(email: "joe@example.com", password: "password", username: "KingKong")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    is_expected.to have_content "Welcome to What I Got"
    is_expected.not_to have_link("Sign me up!")
  end

  subject { page }
  scenario "user creates new collection" do
    click_link "New collection"
    fill_in "title", with: "office"
    click_button "Create collection"
    is_expected.to have_content "office"
    current_path.should == collection_path
    is_expected.to have_content "Collections"
  end
end
