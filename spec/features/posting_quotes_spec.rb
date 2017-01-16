require 'rails_helper'

RSpec.feature "Creating Posts" do
  let(:administrator) {Administrator.create(email: "my@example.com", password: "password" )}

  let(:post) {Post.create(content: "The Content created", votes: 1, story: "My story", author: "A Name", administrator: administrator)}

  scenario "as a logged in user I can post a quote" do
    login(administrator)

    click_link "Admin Page"    
    click_link "Post Something"
    fill_in "Content", with: post.content
    fill_in "Author", with: post.author
    fill_in "Story", with: post.story
    fill_in "Votes", with: post.votes
    click_on "Create Post"

    expect(page).to have_content "Post was successfully created."
    expect(page).to have_content post.content
    expect(page.current_path).to eq(posts_path)
  end

  scenario "as a logged in user I cannot create a new post" do
    login(administrator)
    
    click_link "Admin Page"    
    click_link "Post Something"
    fill_in "Content", with: ""
    fill_in "Author", with: ""
    fill_in "Story", with: ""
    fill_in "Votes", with: ""
    fill_in "Administrator", with: ""
    click_on "Create Post"

    expect(page).to have_content "Post not created"
    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content "New Post"
  end
end
