require 'rails_helper'

RSpec.feature "Like feature" do
  let(:user) {User.create!(user_name: "My Name", email: "my@example.com", password: "password" )}

  before do
    @post = Post.create!(content: "The Content created", votes: 1, story: "My story", author: "Authors Name", user: user )
  end

  scenario "users can like quotes" do
    visit root_path

    click_link "Motivation"
    click_link @post.author
    click_on "Like"
    expect(@post.votes).to eq 1
  end
end

