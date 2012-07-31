class Profile::PicturesController < Profile::ProfileController

  def index
			@album = current_user.albums.find(params[:album_id])
			@pictures = @album.pictures
  end

  def edit
		if current_user.admin
			@album = Album.find(params[:album_id])
		else
			@album = current_user.albums.find(params[:album_id])
		end
		@picture = Picture.find(params[:id])
  end

	def multiupload
		@album = Album.find_by_id(params[:album_id])
		if !@album.nil?
			@picture = Picture.new(params[:picture])
			@picture.user = current_user
			@picture.album = @album
			if @picture.save!
				render :nothing => true
			else
				render :nothing => true
			end
		else
			render :action => "index"
		end
	end

  def show
  end

  def create
		@album = Album.find_by_id(params[:album_id])
		if !@album.nil?
			@picture = Picture.new(params[:picture])
			@picture.user = current_user
			@picture.album = @album
			if @picture.save!
				redirect_to profile_album_pictures_path(@album), :notice => "Successfully added a Photo!"
			else
				render :action => "index"
			end
		else
			render :action => "index"
		end
  end

  def update
		@album = Album.find_by_id(params[:album_id])
		if !@album.nil?
			@picture = Picture.find(params[:id])
			@picture.user = current_user
			@picture.album = @album
			@picture.description = params[:picture][:description]
			@picture.title = params[:picture][:title]
			if @picture.save!
				redirect_to profile_album_pictures_path(@picture.album), :notice => "Successfully deleted an Picture!"	
			else
				redirect_to profile_album_pictures_path(@picture.album), :alert => "Error on deleting an Picture!"	
			end
		else
				redirect_to profile_album_pictures_path(@picture.album), :alert => "Error on fetching an album!"	
		end
  end

  def destroy
		@picture = Picture.find(params[:id])
		if current_user == @picture.user || current_user.admin
			if @picture.destroy
				redirect_to album_pictures_path(@picture.album), :notice => "Successfully deleted an Picture!"	
			else
				redirect_to profile_album_pictures_path(@picture.album), :alert => "Error on deleting an Picture!"	
			end
		end
  end

end
