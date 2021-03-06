module Features
  module SessionHelpers
    def login_as(user)
      visit new_user_session_path unless current_path == new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "password"
      click_button 'Sign in'
      expect(page).to have_content("You are now signed in.")
    end
  end
end
