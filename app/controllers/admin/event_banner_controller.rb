class Admin::EventBannerController < Admin::AdminController
  def create
		@banner = EventBanner.new(params[:event_banner])
		if @banner.save!
			redirect_to admin_event_banner_index_path, :notice => "Successfully added an Event Banner"
		else
			redirect_to admin_event_banner_index_path, :alert => "Error adding an Event Banner"
		end
  end

  def index
		@banners = EventBanner.page(params[:page])
  end

  def edit
		@banner = EventBanner.find(params[:id])
  end

  def new
		@banner = EventBanner.new
  end

  def show
		@banner = EventBanner.find(params[:id])
  end

  def destroy
		@banner = EventBanner.find(params[:id])
		if @banner.destroy
			redirect_to admin_event_banner_index_path, :notice => "Successfully deleted an Event Banner"
		else
			redirect_to admin_event_banner_index_path, :alert => "Error deleting an Event Banner"
		end
  end

end
