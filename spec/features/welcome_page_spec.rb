require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Showing the Welcome Page" do
  
  scenario "user visits the root path and can visit other pages" do
    visit root_path

    expect(page).to have_link("Admin Login")
    expect(page).to have_link("Motivation")
    expect(page).to have_link("Lets Talk")
  end

  scenario "unless users are logged in they cannot see these links" do
    visit root_path

    expect(page).not_to have_link("Logout")
    expect(page).not_to have_link("Admin Page")
  end
end
