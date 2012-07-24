class Admin::CategoriesController < Admin::AdminController
  def index
		@categories = Category.page(params[:page])
		@category = Category.new
  end

  def new
		@categories = Category.all
		@category = Category.new
  end

  def create
		@category = Category.new(params[:category])
		if @category.save!
			redirect_to admin_categories_path, :notice => "Successfully Addded a Category"
		else
			redirect_to admin_categories_path, :alert => "Error Adding Category"
		end
  end

  def update
		@category = Category.find(params[:id])
		@category.title = params[:category][:title]
		if @category.save!
			redirect_to admin_categories_path, :notice => "Successfully save a Category"
		else
			redirect_to admin_categories_path, :alert => "Error saving Category"
		end
  end

  def edit
		@category = Category.find(params[:id])
  end

end
