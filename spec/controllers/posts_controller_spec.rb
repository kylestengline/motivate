require 'rails_helper'
require 'capybara/rails'

RSpec.describe PostsController, :type => :controller do

  describe "POST #vote" do

    let!(:post1) {Post.create!(content: "The Content created", votes: 1, story: "My story", author: "Authors Name")}

    context "a user and like a post" do
      it "increments the number of likes" do

        post :vote, post1: { votes: 2 }, 
          post1_id: post1.id,
          xhr: true  
        expect { post.votes }.to change{post.votes}.from(1).to(2)

      end
    end
  end
end
