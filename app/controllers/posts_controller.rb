class PostsController < ApplicationController
  before_action :set_post, only: [:show, :vote]

  def index
    @posts = Post.all
  end

  def show
  end

  def vote
    @post.update(votes: @post.votes + 1)
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end
end
