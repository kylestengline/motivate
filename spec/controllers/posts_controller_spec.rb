require 'rails_helper'
require 'capybara/rails'

RSpec.describe PostsController, :type => :controller do

  describe "POST #show" do

    let!(:post) {Post.create(content: "The Content created", votes: 1, story: "My story", author: "Authors Name")}

    it "increments the number of likes" do
      #post :vote, params: { post: { votes: 1 } }, xhr: true  
      xhr post :vote, post: {votes: 1}
      expect { post.votes }.to change{post.votes}.from(1).to(2)

    end
  end
end
