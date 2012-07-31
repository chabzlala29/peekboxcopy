class ContactUsMailer < ActionMailer::Base
  default :from => "peekbox.application@gmail.com",
					:to => User.is_admin.map(&:email)

	 def contact_admin(contact)
		@info = contact
		email_address = @info[:email_address]
	
    mail(:subject => "Contact Form:#{email_address}")
  end
end
