class Admin::AdminController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_admin!
	before_filter :banned_user!

	def check_admin!
		unless current_user.admin
			redirect_to destroy_user_session_url, :method => :delete
		end
	end

	def banned_user!
		unless current_user.banned == false
			redirect_to destroy_user_session_url, :method => :delete
		end

	end
end
