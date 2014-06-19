Fabricator(:user) do
  email { sequence(:email) { Faker::Internet.email } }
  username { sequence(:username) { Faker::Internet.user_name.gsub(/[^0-9a-z]/i, '') } }
  password 'password'
  password_confirmation 'password'
end
