module SessionsHelper
#(user)
	def login
		session[:user_id] = administrator.id
	end

	def logged_in?
		!current_user.nil?
	end

	def logout
		# binding.pry
		session.delete(:user_id)
		current_user = nil
		reset_session
	end
end
