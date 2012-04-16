class Profile::ProfileController < ApplicationController
	before_filter :authenticate_user!
	before_filter :banned_user!

	def index
		@user = current_user
	end

	def banned_user!
		unless current_user.banned == true
			redirect_to destroy_user_session_url, :method => :delete, :alert => "YOU ARE BANNED!"
		end
	end

end
