require 'spec_helper'

feature "User visits profile page" do
  let!(:kate) { Fabricate(:user, email: "kate@example.com", username: "kate") }

  subject { page }
  scenario "views own profile" do
    login_as kate
    visit user_path(kate)
    is_expected.to have_content("Logged in as:")
    is_expected.to have_content("New collection")
    is_expected.to have_content("View collections")
    is_expected.to have_content("Sign out")
  end

end
