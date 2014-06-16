require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit '/'
    click_link "Sign me up!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"
    page.should have_content "Welcome to What I Got, joe!"
    current_path.should == dashboard_path
  end

  scenario "failed signup" do
    pending
    User.create(email: "joe@example.com", username: "joe", password: "password", password_confirmation: "password")
    visit '/'
    click_link "Sign me up!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "notthesame"
    # PR 1: Captchas
    click_button "Sign up"
    page.should_not have_content "Welcome to What I Got!"
    page.should have_content "Your account could not be created."

    page.should have_error("already exists", on: "Email")
    page.should have_error("must match confirmation", on: "Password")
    page.should have_error("must be unique", on: "Username")
  end
end
