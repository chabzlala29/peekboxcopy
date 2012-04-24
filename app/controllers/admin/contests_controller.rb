class Admin::ContestsController < Admin::AdminController
  def index
		@contests = Contest.page(params[:page])
  end

  def new
		@contests = Contest.all
		@contest = Contest.new
  end

  def create
		@contest = Contest.new(params[:contest])
		if @contest.save!
			redirect_to new_admin_contest_path, :notice => "Successfully Addded a Contest"
		else
			redirect_to new_admin_contest_path, :alert => "Error Adding Contest"
		end
  end

  def update
		@contest = Contest.find(params[:id])
		@contest.title = params[:contest][:title]
		if @contest.save!
			redirect_to new_admin_contest_path, :notice => "Successfully save a Contest"
		else
			redirect_to new_admin_contest_path, :alert => "Error saving Contest"
		end
  end

  def edit
		@contest = Contest.find(params[:id])
  end

  def destroy
  end

  def show
		@contest = Contest.find(params[:id])
		@videos = @contest.videos.page(params[:page])
  end

end
