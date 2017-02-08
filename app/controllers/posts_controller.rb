class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def vote
    @post = Post.find(params[:id])
    @post.update(votes: @post.votes + 1)
  end
end
