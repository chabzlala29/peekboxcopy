class StaticController < ApplicationController
  def help
  end

  def company
  end

  def contact
		ContactUsMailer.contact_admin(params[:contact]).deliver	
		redirect_to company_path, :notice => "Successfully sent contact us"
		
  end

end
