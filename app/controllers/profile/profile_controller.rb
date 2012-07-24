class Profile::ProfileController < ApplicationController
	before_filter :authenticate_user!
	before_filter :banned_user!

	def index
		@user = current_user
	end

	def banned_user!
		if current_user.banned == true
			redirect_to destroy_user_session_path, :method => :delete
		end
	end

end
