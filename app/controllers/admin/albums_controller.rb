class Admin::AlbumsController < ApplicationController
  def destroy
		@album = Album.find(params[:id])
		if @album.destroy
			redirect_to albums_path, :notice => "Successfully deleted an Album!"
		else
			redirect_to admin_album_pictures_path(@album), :notice => "unable to delete an Album!"
		end
  end

  def index
  end

  def edit
  end

  def update
  end

end
