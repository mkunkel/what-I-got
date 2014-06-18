require 'spec_helper'

feature "User visits profile page" do
  let!(:kate) { Fabricate(:user, email: "kate@example.com", username: "kate") }

  scenario "views own profile" do
    login_as kate
    visit user_path(kate)
    page.should have_content("I'm a user's profile!!")
    page.should have_content("What would you like to do?")
    page.should have_content("Create a collection")
    page.should have_content("View collections")
  end

end
