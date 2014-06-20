require 'spec_helper'

feature "User adds collection" do

  subject { page }
  scenario "clicks new collection button" do
    visit 'new_collection_path'
    # click_link "Sign me up!"
    # fill_in "Email", with: "joe@example.com"
    # fill_in "Username", with: "joe"
    # fill_in "Password", with: "mypassword"
    # fill_in "Password confirmation", with: "mypassword"
    # click_button "Sign up"
    # is_expected.to have_content "Welcome to What I Got!"
    # is_expected.not_to have_link("Sign me up!")

    click_button "Add collection"
    is_expected.to have_content "What would you like to add?"
  end
end
