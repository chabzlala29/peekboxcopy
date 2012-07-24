class Profile::CropController < Profile::ProfileController
  def edit
		@user = User.find_by_id(params[:id])
		if @user.profilepic == nil
			redirect_to edit_profile_information_path(@user.id), :notice => "Please upload a photo!"
		end
  end

  def update
		@user = User.find_by_id(params[:user][:id])
		if params[:cx].to_i > 1
			@user.crop_x = params[:cx]
			@user.crop_y = params[:cy]
			@user.crop_h = params[:h]
			@user.crop_w = params[:w]
		end
		if @user.save! 
			redirect_to profile_path, :notice => "Successfully save crop photo!"
		else
			render :action => "index"
		end
  end

end
