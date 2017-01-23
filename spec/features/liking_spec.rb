require 'rails_helper'

RSpec.feature "Like feature" do

  before do
    @post = Post.create!(content: "The Content created", votes: 1, story: "My story", author: "Authors Name")
  end

  scenario "users can like quotes" do
    visit root_path

    click_link "Motivation"
    click_link @post.author
    click_on "Like"
    expect(@post.votes).to eq 1
  end
end

