module ApplicationHelper
	def is_admin?
		session[:user_type] == 'Administrator'
	end

# Have to re-seed in order to run users and create posts with user_id's. therwise, it errors out.
	# def is_user?
	# 	session[:user_type] == 'User'
	# end
end
