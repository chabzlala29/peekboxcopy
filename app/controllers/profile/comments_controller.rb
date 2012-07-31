class Profile::CommentsController < Profile::ProfileController
	def create
		@video = Video.find(params[:video_id])
		@comment = Comment.new
		@comment.body = params[:comment][:text]
		@comment.video = @video
		@comment.user = current_user

		if @comment.save
			redirect_to video_path(@video), :notice => "Successfully added a comment!"	
		else
			redirect_to video_path(@video), :alert => "Failed add a comment!"	
		end

	end

  def new
  end

  def index
  end

  def show
  end

  def destroy
  end

end
