class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :admin_only

  before_action except: [:login, :login_form] do
    redirect_to administrators_login_form_path unless authorized?
  end

 # before_action :set_administrator, only: [:show, :edit, :logout]

  def index
    @posts = Post.all
   # @administrator = Administrator.find(params[:id])
  end

  def show
    #@comment = @post.comments.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to admin_posts_path
    else
      flash.now[:danger] = "Post not created"
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
       redirect_to admin_post_path(@post)
       flash[:notice] = 'Post was successfully updated.'
    else
      flash[:danger] = 'Post not updated' 
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.destroy
      redirect_to admin_posts_path
      flash[:notice] = 'Post was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post)
        .permit(:title, :content, :story, :votes, :author)
    end

    def admin_only
      unless admin?
        flash[:error] = "You don't have authorization to do that!"
        redirect_to root_path
      end
    end

    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    def authorized?
      !current_user.nil? || current_user.is_a?(Administrator)
    end

    def administrator_params
      params.require(:administrator).permit(:email, :password)
    end
end
