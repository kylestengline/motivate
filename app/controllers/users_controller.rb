class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :login]

  # before_action except: [:show, :login, :login_form] do
  #   redirect_to users_login_form_path unless authorized?
  # end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def login
    # binding.pry
    user = User.find_by(email: params['session']['email'])

    if user && user.authenticate(params['session']['password'])
      session[:user_type] = 'User'
      session[:user_id] = user.id
      @user = session[:email]

      cookies[:email] = user.email
      # cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}
      
      redirect_to user_path(user)
    else
      @error = true
      render :login_form
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    # show posts by this user.
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        login @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def authorized?
      !current_user.nil? || current_user.is_a?(User)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :user_name)#, :administrator_id)
    end
end
