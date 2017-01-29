require 'rails_helper'

RSpec.feature "Deleting Posts" do
  let(:administrator) {Administrator.create!(name: "My Name", email: "my@example.com", password: "password" )}

  let!(:post) {Post.create!(content: "The Content created", votes: 1, story: "My story", author: "A Name")}

  scenario "admins can delete posts" do
    login(administrator)

    click_link "Admin Page"
    click_on "Delete"

    expect(page).to have_current_path(admin_posts_path)
    expect(page).to have_content "Post was successfully destroyed."
  end
end
