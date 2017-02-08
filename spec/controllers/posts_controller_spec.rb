require 'rails_helper'
require 'capybara/rails'

RSpec.describe PostsController, :type => :controller do

  describe "POST #vote" do

    let(:post1) {Post.create!(content: "The Content created", votes: 1, story: "My story", author: "Authors Name")}

    context "a user can vote on a post" do
      it "increments the number of votes" do

        post :vote, post1: { votes: post1.votes }, 
          params: { id: post1.id },
          xhr: true

        expect { post1.votes }.to change{post1.votes}.by(1)

      end
    end
  end
end
