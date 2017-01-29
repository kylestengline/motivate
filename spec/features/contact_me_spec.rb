require 'rails_helper'

RSpec.feature "Contacting Me" do

  let(:contact) {Contact.create(name: "User Name", email: "me@me.com", message: "I have a story to tell.")}

  scenario "Users can contact me through contact form" do
    visit root_path

    click_on "Motivation"
    click_on "Contact"

    fill_in "Name", with: contact.name
    fill_in "Email", with: contact.email
    fill_in "Message", with: contact.message

    click_on "Get in Touch"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content "Submission Successful!"
  end

  scenario "Users cannot contact me through contact form" do
    visit root_path

    click_on "Motivation"
    click_on "Contact"

    fill_in "Name", with: "" 
    fill_in "Email", with: ""
    fill_in "Message", with: ""

    click_on "Get in Touch"

    expect(page).to have_current_path(contacts_path)
    expect(page).to have_content "Unsuccessful Submission"
  end
end
