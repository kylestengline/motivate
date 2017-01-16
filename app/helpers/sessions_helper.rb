module SessionsHelper

	def login
		session[:user_id] = administrator.id
	end

	def logged_in?
		!current_user.nil?
	end

  def current_user
    case session[:user_type]
      when 'Administrator' then Administrator.find_by(id: session[:user_id])
      # when 'User' then User.find_by(id: session[:user_id])
    end
  end

  def admin?
    current_user && current_user == 'Administrator'
  end

	def logout
		session.delete(:user_id)
    redirect_to root_path
	end
end
