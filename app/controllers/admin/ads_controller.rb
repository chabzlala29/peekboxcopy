class Admin::AdsController < Admin::AdminController
  def index
		@ads = Ads.order("id").reverse_order.page(params[:page])
  end

  def new
		@ads = Ads.new
  end

  def create
		@ads = Ads.create
		@ads.title = params[:ads][:title]
		@ads.url = params[:ads][:url]
		@ads.location = params[:ads][:location]
		@ads.banner = params[:ads][:banner]
		if @ads.save!
			redirect_to admin_ads_path, :notice => "Successfully added an Ad"
		else
			redirect_to new_admin_ad_path, :alert => "Failed to Add an Ad"
		end
  end

  def update
		@ad = Ads.find(params[:id])
		@ad.title = params[:ads][:title]
		@ad.url = params[:ads][:url]
		@ad.location = params[:ads][:location]
		if @ad.save!
			redirect_to admin_ads_path, :notice => "Successfully Updated an Ad"
		else
			redirect_to new_admin_ad_path, :alert => "Failed to Update  an Ad"
		end
  end

  def destroy
		@ad = Ads.find_by_id(params[:id])
		if @ad.destroy
			redirect_to admin_ads_path, :notice => "Successfully deleted an Ad"
		end
  end

  def show
		@ads = Ads.find_by_id(params[:id])
  end

end
