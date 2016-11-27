class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 def current_user
   case session[:user_type]
     when 'Administrator' then Administrator.find_by(id: session[:user_id])
#       when 'User' then User.find_by(id: session[:user_id])
   end
 end

  	def logout 
      session.delete(:user_id)
      @current_user = nil
 	# 	reset_session
 	end
end
