require 'spec_helper'

feature "User visits profile page" do
  let!(:user) { Fabricate(:user) }

  subject { page }
  scenario "views own profile" do
    login_as user
    visit user_path(user)

    is_expected.to have_content("I'm a user's profile!!")
    is_expected.to have_content("What would you like to do?")
    is_expected.to have_content("Create a collection")
    is_expected.to have_content("View collections")
  end

end
