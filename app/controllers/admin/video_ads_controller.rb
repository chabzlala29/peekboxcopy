class Admin::VideoAdsController < Admin::AdminController
  def index
		@videoAds = VideoAd.page(params[:page])
  end

  def show
		@videoAd = VideoAd.find(params[:id])
  end

  def destroy
		@videoAd = VideoAd.find(params[:id])
		if @videoAd.destroy
			redirect_to admin_video_ads_path, :notice => "Successfully deleted a Video ad"
		else	
			redirect_to new_admin_video_ads_path, :notice => "Error deleting a Video ad"
		end
  end

  def update
  end

  def create
		@videoAd = VideoAd.new(params[:video_ad])
		@videoAd.title = params[:video_ad][:title]
		if @videoAd.save!
			redirect_to admin_video_ads_path, :notice => "Successfully added a Video ad"
		else
			redirect_to new_admin_video_ads_path, :notice => "Error uploading a Video ad"
		end
  end

  def new
		@videoAd = VideoAd.new
  end

end
