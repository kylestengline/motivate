class SessionsController < ApplicationController
  
  def new
  end

  def current_user
    case session[:user_type]
      when 'Administrator' then Administrator.find_by(id: session[:user_id])
      # when 'User' then User.find_by(id: session[:user_id])
    end
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
  	logout
    redirect_to root_path
  end
end
