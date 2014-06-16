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
    page.should have_content "Welcome to What I Got!"
    page.should_not have_link("Sign me up!")

    click_link "Sign out"
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Log in"
    page.should have_content "You had signed in successfully"
  end

  scenario "failed signup" do
    User.create(email: "joe@example.com", username: "joe", password: "password", password_confirmation: "password")
    visit '/'
    click_link "Sign me up!"
    page.should_not have_content "Welcome to What I Got!"
    page.should have_content "Your account could not be created."
    page.should have_error("has already been taken", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
    page.should have_error("must be unique", on: "Username")
  end
end
