class SessionsController < ApplicationController
  
  def new
  end

  def create 
  	# logs in the user after signing up. While authenticating the email and password
  	user = Administrator.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		login user
      redirect_to user
  	else
  		flash.now[:danger] = "Invalid Email and Password Combo"
      render :new
  	end
  end

  def destroy
    session.delete('user_id')
    redirect_to root_path
  end
end
