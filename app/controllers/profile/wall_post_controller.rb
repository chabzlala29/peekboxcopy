class Profile::WallPostController < Profile::ProfileController
  def create
		@wall_post = WallPost.new
		@wall_post.poster = current_user
		@user = User.find(params[:user_id])
		@wall_post.user = @user
		@wall_post.post = params[:wall_post][:post]
		if @wall_post.save!
			redirect_to other_user_path(@user.username), :notice => "Sucessfully added a Wall Post!"
		else
			redirect_to other_user_path(@user.username), :notice => "Error on adding a Wall Post!"
		end
  end

  def destroy
  end

end
