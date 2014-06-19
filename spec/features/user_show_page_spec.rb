require 'spec_helper'

feature "User visits profile page" do
  let!(:kate) { Fabricate(:user, email: "kate@example.com", username: "kate") }

  subject { page }
  scenario "views own profile" do
    login_as kate
    visit user_path(kate)
    is_expected.to have_content("I'm a user's profile!!")
    is_expected.to have_content("What would you like to do?")
    is_expected.to have_content("Create a collection")
    is_expected.to have_content("View collections")
  end

end
