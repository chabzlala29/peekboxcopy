class Profile::InformationController < Profile::ProfileController
  def search
  end

  def show
  end

	def edit
		@user = User.find(params[:id])
	end

	def save
		@user = User.find(params[:id])
	end

end
