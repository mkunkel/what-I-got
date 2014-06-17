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
    click_button "Sign in"
    page.should have_content "You are now signed in."
  end

  scenario "with username, rather than email" do
    Fabricate(:user, username: "joe")
    visit "/"
    click_link "Sign in"
    fill_in "Email/Username", with: "joe"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("You are now signed in.")
    page.should_not have_link("Sign me up!")
  end

  scenario "failed login" do
    Fabricate(:user, username: "joe")
    visit "/"
    click_link "Sign in"
    fill_in "Email/Username", with: "jocephus"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("Invalid login or password.")
  end

  scenario "failed signup" do
    Fabricate(:user, email: "joe@example.com", username: "joe")
    visit '/'
    click_link "Sign me up!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "notthesame"
    click_button "Sign up"
    page.should_not have_content "Welcome to What I Got!"
    page.should have_content "Your account could not be created."

    page.should have_error("has already been taken", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
    page.should have_error("has already been taken", on: "Username")
  end

  scenario "failed signup becuase invalid characters in username" do
    visit "/"
    click_link "Sign me up!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "Vampire&Tickler"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should_not have_content "Welcome to What I Got!"
    page.should have_content "Your account could not be created."
    page.should have_error("username can only contain letters", on: "Username")
  end

  scenario "failed signup because invalid characters in username" do
    visit '/'
    click_link "Sign me up!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "Drum Slayer 500"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should_not have_content "Welcome to What I Got!"
    page.should have_content "Your account could not be created."
    page.should have_error("username can only contain letters", on: "Username")
  end
end
