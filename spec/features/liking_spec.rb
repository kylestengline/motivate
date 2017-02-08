require 'rails_helper'

RSpec.feature "Like feature" do

  let!(:post) {Post.create!(content: "The Content created", votes: 1, story: "My story", author: "Authors Name")}

  scenario "users can like quotes" do
    visit root_path

    click_link "Motivation"
    click_link post.author

    expect(page).to have_button "Like"
    expect(page).to have_current_path post_path(post.id)

    click_button "Like"

    expect { post.votes }.to change{post.votes}.by(1)

  end
end

