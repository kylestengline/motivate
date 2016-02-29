class SessionsController < ApplicationController
  
  def new

  end

  def create 
  	# logs in the user after signing up. While authenticating the email and password
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user_path(user)
  	else
  		flash.now[:danger] = "Invalid Email and Password Combo"
  	render 'new'
  	end
  end

end
