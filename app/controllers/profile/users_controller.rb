class Profile::UsersController < Profile::ProfileController
  def index
  end

  def search
		username = params[:friend][:username]
		@users = User.where("username LIKE ?", "%#{username}%")	
  end

end
