class Profile::FriendsController < Profile::ProfileController
  def index
		@friends = current_user.friends.order("id").page(params[:page])
  end

	def all
		@friends = User.order("id").where("id != ?", "#{current_user.id}").page(params[:page])
	end

	def add
		@user = current_user
		@friend = User.find(params[:id])
		if @user.is_stranger(@friend)
			@friend.friends << @user
			@user.friends << @friend
			redirect_to profile_friends_path, :notice => "Successfully added #{@friend.username} as a friend!"
		else
			redirect_to profile_friends_path, :error => "unable to add this friend"
		end
	end

	def search
		@friends = Friends.search_username(params[:friend][:username])
	end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
		@friendship = Friendship.where(:friend_id => params[:id], :user_id => current_user.id)
		@friendship2 = Friendship.where(:user_id => params[:id], :friend_id => current_user.id)
		@friend = User.find(params[:id])
		if @friendship.destroy_all and @friendship2.destroy_all
			redirect_to profile_friends_path, :notice => "Successfully unfriend #{@friend.username}!"
		else
			redirect_to profile_friends_path, :error => "unable to unfriend this friend"
		end
  end

  def update
  end

  def create
  end

end
