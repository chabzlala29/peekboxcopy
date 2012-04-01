class Profile::UserController < Profile::ProfileController

	def index
		@user = current_user
	end
	def result
	end

	def search
	end

	def edit
	end

	def update
		@user = User.find_by_id(params[:user][:id])
		@user.shoutout = params[:user][:shoutout]
		@user.first_name = params[:user][:first_name]
		@user.last_name= params[:user][:last_name]
		@user.location = params[:user][:location]
		@user.occupation = params[:user][:occupation]
		@user.sex = params[:user][:sex]
		@user.website = params[:user][:website]
		@user.profilepic = params[:user][:profilepic]

		if params[:cx].to_i > 1
			@user.crop_x = params[:cx]
			@user.crop_y = params[:cy]
			@user.crop_h = params[:h]
			@user.crop_w = params[:w]
		end
		if @user.save! 
			redirect_to profile_path, :notice => "Successfully save profile information!"
		else
			render :action => "index"
		end
	end
end
