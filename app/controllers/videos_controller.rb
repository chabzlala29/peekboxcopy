class VideosController < ApplicationController
  def index
		@videos = Video.processed.page(params[:page])
		@all_categories = Category.all
		@ad ||= Ads.find_by_location("videos")
  end

  def show
		rand_id = rand(VideoAd.count)
		rand_record = VideoAd.processed.first(:offset => rand_id)
		@videoAd ||= rand_record
		@video = Video.find_by_id(params[:id])
		@all_categories = Category.all
		if !@video.processed?
			flash[:notice] = "Video is still Processing. Please Wait"
		end
		
  end

end
