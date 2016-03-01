class WelcomeController < ApplicationController
	
	def index
		# @user_name = User.where(user_id.user_name)
		# Want the users user name to show here.
		@posts = Post.all
	end

end
