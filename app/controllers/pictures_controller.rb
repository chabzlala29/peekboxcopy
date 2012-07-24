class PicturesController < ApplicationController
  def index
		@album = Album.find_by_id(params[:album_id])
		@pictures = @album.pictures.page(params[:page])
		@user ||= @album.user
		@ad ||= Ads.find_by_location("album")
  end

  def show
		@album = Album.find_by_id(params[:album_id])
		@pictures = @album.pictures.page(params[:page]).per(1)
  end
end
