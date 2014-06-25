require 'spec_helper'

feature "User signs up" do

  subject { page }
  scenario "happy path" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword", :match => :first
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"
    is_expected.to have_content "Welcome to What I Got!"
    is_expected.not_to have_link("Sign up")

    click_link "Sign out"
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
    is_expected.to have_content "You are now signed in."
  end

  scenario "with username, rather than email" do
    Fabricate(:user, username: "joe")
    visit "/"
    click_link "Sign in"
    fill_in "Email/Username", with: "joe"
    fill_in "Password", with: "password"
    click_button "Sign in"
    is_expected.to have_content("You are now signed in.")
    is_expected.not_to have_link("Sign up")
  end

  scenario "failed login" do
    Fabricate(:user, username: "joe")
    visit "/"
    click_link "Sign in"
    fill_in "Email/Username", with: "jocephus"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
    is_expected.to have_content("Invalid login or password.")
  end

  scenario "failed signup" do
    Fabricate(:user, email: "joe@example.com", username: "joe")
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword", :match => :first
    fill_in "Password confirmation", with: "notthesame"
    click_button "Sign up"
    is_expected.not_to have_content "Welcome to What I Got!"
    is_expected.to have_content "Your account could not be created."

    is_expected.to have_error("has already been taken", on: "Email")
    is_expected.to have_error("doesn't match Password", on: "Password confirmation")
    is_expected.to have_error("has already been taken", on: "Username")
  end

  scenario "failed signup becuase invalid characters in username" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "Vampire&Tickler"
    fill_in "Password", with: "mypassword", :match => :first
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"
    is_expected.not_to have_content "Welcome to What I Got!"
    is_expected.to have_content "Your account could not be created."
    is_expected.to have_error("username can only contain letters", on: "Username")
  end

  scenario "failed signup because invalid characters in username" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "Drum Slayer 500"
    fill_in "Password", with: "mypassword", :match => :first
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"
    is_expected.not_to have_content "Welcome to What I Got!"
    is_expected.to have_content "Your account could not be created."
    is_expected.to have_error("username can only contain letters", on: "Username")
  end
end
