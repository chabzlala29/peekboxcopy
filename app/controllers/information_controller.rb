class InformationController < ApplicationController

	def index
	end	

  def search
  end

  def show
		@user = User.find_by_username(params[:username])
		@videos = @user.videos.for_page
		@albums = @user.albums.for_page
		@events = @user.events.for_page
  end

end
