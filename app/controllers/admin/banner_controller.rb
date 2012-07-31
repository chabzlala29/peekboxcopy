class Admin::BannerController < Admin::AdminController
  def index
		@banners = Banner.order("id").reverse_order.page(params[:page])
  end

	def new
		@banner = Banner.new
	end

  def show
		@banner = Banner.find(params[:id])
  end

  def edit
  end

	def destroy
		@banner = Banner.find(params[:id])
		if @banner.destroy
			redirect_to admin_banner_index_path, :notice => "Sucessfully deleted a Banner!"
		else
			redirect_to new_admin_banner_path, :notice => "Failed to delete a Banner!"
		end
	end

  def create
		@banner = Banner.create(params[:banner])
		if @banner.save!
			redirect_to admin_banner_index_path, :notice => "Sucessfully Added a Banner!"
		else
			redirect_to new_admin_banner_path, :notice => "Failed to Add a Banner!"
		end
  end

end
