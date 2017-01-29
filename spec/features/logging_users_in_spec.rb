require 'rails_helper'

RSpec.feature "Logging in" do

  let(:administrator) {Administrator.create(name: "My Name", email: "my@example.com", password: "password" )}

  scenario "administrator can log in" do
    visit root_path

    click_link "Admin Login"

    fill_in "Email", with: administrator.email
    fill_in "Password", with: administrator.password
    click_on "Log Me In. Please and Thanks!"

    expect(page).to have_content "Successfully Logged In!"
    expect(page).to have_content "Admin Page"
    expect(page).to have_link "Motivation"
    expect(page).to have_link "Lets Talk"
    expect(page).to have_link "Logout"
  end

end
