class Admin::UserController < Admin::AdminController
  def index
		@users = User.not_admin.page(params[:page])
  end

  def admin
		@users = User.is_admin.page(params[:page])
		render "index"
  end

  def ban
		@user = User.find(params[:format])
		@user.banned = true
		if @user.save!
			redirect_to admin_user_index_path, :notice => "Successfully Banned a User" 		
		else
			redirect_to admin_user_index_path, :alert => "Error Banning a User" 		
		end
  end

	def unban
		@user = User.find(params[:format])
		@user.banned = false
		if @user.save!
			redirect_to admin_user_index_path, :notice => "Successfully Un-Banned a User" 		
		else
			redirect_to admin_user_index_path, :alert => "Error UnBanning a User" 		
		end
	end

	def make_admin
		@user = User.find(params[:format])
		@user.admin = true
		if @user.save
			redirect_to admin_user_index_path, :notice => "Successfully made a User Admin" 		
		else
			redirect_to admin_user_index_path, :alert => "Error making a User an Admin" 		
		end
	end

	def make_normal
		@user = User.find(params[:format])
		@user.admin = false
		if @user.save
			redirect_to admin_user_index_path, :notice => "Successfully made a User Admin" 		
		else
			redirect_to admin_user_index_path, :alert => "Error making a User an Admin" 		
		end
	end

	def delete_user
		@user = User.find(params[:format])
		if @user.destroy
			redirect_to admin_user_index_path, :notice => "Successfully deleted a User" 		
		else
			redirect_to admin_user_index_path, :alert => "Error deleting a user" 		
		end
	end
	
	def ban_list
		@users = User.ban_list.page(params[:page])
	end

end
