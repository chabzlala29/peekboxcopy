class Profile::VideosController < Profile::ProfileController

	def index
		@videos = current_user.videos.processed.order("id").page(params[:page])
		@all_categories = Category.all
	end

	def new
		@contests = Contest.enabled
		@all_category = Category.all
		@video = Video.new
	end

	def edit
		@all_category = Category.all
		@video = Video.find_by_id(params[:id])
	end

	def destroy
		@video = Video.find_by_id(params[:id])
		if current_user == @video.user
			if @video.destroy
				redirect_to profile_videos_path, :notice => "Successfully deleted a Video!"	
			else
				redirect_to profile_videos_path, :alert => "Error on deleting an Video!"	
			end
		end

	end

	def update 
		@video = Video.find_by_id(params[:video][:id])
		@video.title = params[:video][:title]
		@video.description = params[:video][:description]
		@video.category = Category.find_by_id(params[:video][:category_id])
		@video.featured = params[:video][:featured]
		if @video.save! 
			redirect_to profile_videos_path, :notice => "Successfully updated a video!"
		else
			render :action => "edit"
		end
	end

	def create
		@video = Video.new
		@video.title = params[:video][:title]
		@video.description = params[:video][:description]
		@video.category = Category.find_by_id(params[:video][:category_id])
		unless params[:video][:contest_id] == ""
			@video.contest = Contest.find(params[:video][:contest_id])
		end
		@video.media = params[:video][:media]
		@video.user = current_user

		code = params[:video][:eligibility_code]
		@eligible = EligibilityCode.find_by_code(code)
		unless @eligible == nil
			@video.eligibility_code = @eligible
			@eligible.taken = true
			@eligible.save!
		end

		if @video.save! 
			redirect_to @video, :notice => "Successfully uploaded a video!"
		else
			render :action => "new"
		end
	end
end
