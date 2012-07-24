class CategoryController < ApplicationController
  def show
		@all_categories = Category.all
		@videos = Category.find_by_id(params[:id]).videos.page(params[:page])
		@title = Category.find_by_id(params[:id])
		@ad ||= Ads.find_by_location("videos")
  end

end
