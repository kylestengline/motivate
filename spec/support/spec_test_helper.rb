def login(user)
  user = Administrator.create(email: "my@example.com", password: "password" )
  visit root_path

  click_link "Login"

  fill_in "Email", with: administrator.email
  fill_in "Password", with: administrator.password
  click_on "Log Me In. Please and Thanks!"
end
