require 'rails_helper'

RSpec.feature "Updating Posts" do
  let(:administrator) {Administrator.create(name: "My Name", email: "my@example.com", password: "password" )}

  let!(:post) {Post.create!(content: "The Content created", votes: 1, story: "My story", author: "A Name")}

  scenario "admins can update posts" do
    login(administrator)

    click_link "Admin Page"

    click_on "Edit"

    expect(current_path).to eq(edit_admin_post_path(post))

    fill_in "Content", with: "Something New"
    fill_in "Story", with: "A different tale than the previous"
    fill_in "Author", with: "Same Author"
    click_on "Update Post"

    expect(page.current_path).to eq(admin_post_path(post))
    expect(page).to have_content "Post was successfully updated."
  end
end
