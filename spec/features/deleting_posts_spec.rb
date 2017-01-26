require 'rails_helper'

RSpec.feature "Deleting Posts" do
  let(:administrator) {Administrator.create(name: "My Name", email: "my@example.com", password: "password" )}

  let(:post) {Post.create(content: "The Content created", votes: 1, story: "My story", author: "A Name")}

  scenario "admins can delete posts" do
    login(administrator)

    click_link "Admin Page"
    page.all(".the-actions tr").each do |tr|
      if tr.has_selector?('a[href*="delete-link"]')
        click_link "Delete"
      end
    end
    byebug

    expect(page).to have_content "Post was successfully destroyed."
    expect(page.current_path).to eq(admin_posts_path)
  end
end
