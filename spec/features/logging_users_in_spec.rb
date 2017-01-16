require 'rails_helper'

RSpec.feature "Logging in" do

  let(:administrator) {Administrator.create(name: "My Name", email: "my@example.com", password: "password" )}

  scenario "administrator can log in" do
    visit root_path

    click_link "Admin Login"

    fill_in "Email", with: administrator.email
    fill_in "Password", with: administrator.password
    click_on "Log Me In. Please and Thanks!"

    # fails b/c redirecting to the root_path and not admin_posts_path when logging in
    expect(page).to have_content "Successfully Logged In!"
    expect(page).to have_content "Hi, #{administrator.name}"

    expect(page).to have_link "Post Something"
    expect(page).to have_link "Home"
    expect(page).to have_link "Logout"
  end

end
