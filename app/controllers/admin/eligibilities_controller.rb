require 'csv'

class Admin::EligibilitiesController < Admin::AdminController
  def index
		@eligibles = EligibilityCode.page(params[:page])
  end

  def new
  end

  def create
		success = 0
		failed = 0
		CSV.foreach(params[:eligibility_code][:file].tempfile) do |row|
			@eligible = EligibilityCode.new
			@eligible.code = row[0]	
			if @eligible.save!
				success+= 1
			else
				failed+= 1
			end
		end
		redirect_to admin_eligibilities_path
  end

  def edit
  end

  def update
  end

  def delete
  end

end
