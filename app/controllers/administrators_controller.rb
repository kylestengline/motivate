class AdministratorsController < ApplicationController
  # before_action :set_administrator, only: [:show, :login]

    # before_action except: [:login, :login_form] do
    #   redirect_to administrators_login_form_path unless authorized?
    # end
  # GET /administrators
  # GET /administrators.json
  def index
    @administrators = Administrator.all
  end

  def login
    admin_user = Administrator.find_by(email: params['session']['email'])
    if admin_user && admin_user.authenticate(params['session']['password'])
      session[:user_type] = 'Administrator'
      session[:user_id] = admin_user.id
      @admin = session[:email]

      cookies[:email] = admin_user.email
      # cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}
      redirect_to administrator_path(admin_user)
    else
      @error = true
      render :login_form
    end
  end

  # GET /administrators/1
  # GET /administrators/1.json
  def show
    @administrator = Administrator.find(params[:id])
    flash[:notice] = "Successfully Logged In!"
    @posts = Post.all
    # @users = User.all
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /administrators/1/edit
  def edit
  end

  # POST /administrators
  # POST /administrators.json
  # def create
  #   @administrator = Administrator.new(administrator_params)

  #   respond_to do |format|
  #     if @administrator.save
  #       format.html { redirect_to @administrator, notice: 'Administrator was successfully created.' }
  #       format.json { render :show, status: :created, location: @administrator }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @administrator.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /administrators/1
  # PATCH/PUT /administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to @administrator, notice: 'Administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrator }
      else
        format.html { render :edit }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  def logout
    session.clear
    # session.delete[:user_id]
    session[:user_type] = nil
    # @current_user = nil
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  # def destroy
  #   @administrator.destroy
  #   respond_to do |format|
  #     format.html { redirect_to administrators_url, notice: 'Administrator was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    def authorized?
      !current_user.nil? || current_user.is_a?(Administrator)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:email, :password)
    end
end
