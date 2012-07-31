class Profile::BookmarkController < Profile::ProfileController
  def index
		@user_events = current_user.peekme
  end

  def create
		@bookmark = Bookmark.new
		@bookmark.user = current_user
		@bookmark.peekme = Event.find(params[:event])
		if @bookmark.save!
			redirect_to event_path(@bookmark.peekme), :notice => "Successfully added a bookmark"
		else
			redirect_to events_path, :alert => "Error adding a bookmark"
		end
  end

  def destroy
		@bookmarked = Bookmark.where(:user_id => current_user.id, :event_id => params[:id]).first
		if @bookmarked.destroy
			redirect_to profile_bookmark_index_path, :notice => "Successfully removed a bookmark"
		else
			redirect_to events_path, :alert => "Error removing a bookmark"
		end
  end

	def unbookmark
		@bookmarked = Bookmark.where(:user_id => current_user.id, :event_id => params[:id]).first
		if @bookmarked.destroy
			redirect_to event_path(@bookmarked.peekme), :notice => "Successfully removed a bookmark"
		else
			redirect_to events_path, :alert => "Error removing a bookmark"
		end

	end

end
