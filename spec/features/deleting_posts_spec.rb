require 'rails_helper'

RSpec.feature "Deleting Posts" do
  let(:administrator) {Administrator.create!(name: "My Name", email: "my@example.com", password: "password" )}

  let(:post) {Post.create!(content: "The Content created", votes: 1, story: "My story", author: "A Name")}

  scenario "admins can delete posts" do
    login(administrator)

    click_link "Admin Page"
#    page.all("tr.the-actions").each do |tr|
      click_on "Delete" if page.has_selector?('a[href*="delete-link"]')
#    end

    expect(page.current_path).to eq(admin_posts_path)
    expect(page).to have_content "Post was successfully destroyed."
  end
end
