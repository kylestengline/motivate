require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Logging Out" do

  let(:administrator) {Administrator.create(name: "My Name", email: "my@example.com", password: "password" )}

  before do 
    visit root_path

    click_link "Admin Login"

    fill_in "Email", with: administrator.email
    fill_in "Password", with: administrator.password
    click_on "Log Me In. Please and Thanks!"
  end

  scenario "logged in users can log out" do

    click_link "Logout"

    expect(page).to have_link "Admin Login"
    expect(page).to have_link "Motivation"
    expect(page).to have_link "Lets Talk"
  end

end
