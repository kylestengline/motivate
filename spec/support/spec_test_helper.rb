require 'capybara/rails'

def login(user)
  user = Administrator.create(name: "My Name", email: "my@example.com", password: "password" )
  visit root_path

  click_link "Admin Login"

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log Me In. Please and Thanks!"
end
