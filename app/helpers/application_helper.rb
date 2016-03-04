module ApplicationHelper
	def is_admin?
		session[:user_type] == 'Administrator'
	end
end
