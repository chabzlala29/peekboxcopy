class Profile::MessagesController < Profile::ProfileController
  def inbox
		@messages = current_user.messages.from_inbox
  end

  def show
  end

  def destroy
  end

  def send_message
		@message = Message.new
		@message.message = params[:message][:message]
		@friend = User.find(params[:message][:friend_id])
		@message.friend = @friend
		@message.message_type = "sent"
		@message.user = current_user

		@message2 = Message.new
		@message2.message = params[:message][:message]
		@friend2 = User.find(params[:message][:friend_id])
		@message2.friend = current_user
		@message2.message_type = "inbox"
		@message2.user = @friend2

		if @message2.save!
			if @message.save!
				redirect_to sent_profile_messages_path, :notice => "Message Sent!"
			else
				redirect_to compose_profile_messages_path, :alert => "Error Sending Message!"
			end
		else
			redirect_to compose_profile_messages_path, :alert => "Error Sending Message!"
		end

  end

  def sent
		@messages = current_user.messages.from_sent
  end

  def compose
		@friends = current_user.friends
  end

end
