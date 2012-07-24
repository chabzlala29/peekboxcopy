class Admin::FeatureController < Admin::AdminController
  def events
		@events = Event.featured.page(params[:page])
  end

  def special
		@events = Event.special.page(params[:page])
  end

  def videos
		@videos = Video.featured.page(params[:page])
  end

  def albums
		@albums = Album.featured.page(params[:page])
  end

end
