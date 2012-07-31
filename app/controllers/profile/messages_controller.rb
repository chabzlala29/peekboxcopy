class Profile::MessagesController < Profile::ProfileController


  def inbox
		@messages = current_user.received_messages.page(params[:page]).per(20)

  end

  def show
  end

  def destroy
  end

  def send_message
    begin
      current_user.messages.create!(params[:message])
      redirect_to sent_profile_messages_path, :notice => "Message Sent!"
    rescue ActiveRecord::RecordInvalid => e
      redirect_to compose_profile_messages_path, :alert => e.message
    end
  end

  def sent
		@messages = current_user.sent_messages
  end

  def compose
		@friends = current_user.friends
  end

end
