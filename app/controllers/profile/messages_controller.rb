class Profile::MessagesController < Profile::ProfileController
  before_filter :load_user_message, :only => :destroy

  def inbox
		@messages = current_user.received_messages.page(params[:page]).per(20)
  end

  def show
  end

  def destroy
    raise Exception if @user_message.user != current_user
    @user_message.destroy
    redirect_to request.referer, :notice => "Yay! Success!"
  end

  def send_message
    begin
      form_params = params[:message]
      form_params[:recipients] = [params[:message][:friend_id]] #TODO: change this after implementing multiple recipients
      form_params.delete(:friend_id)
      current_user.messages.create!(form_params)
      redirect_to sent_profile_messages_path, :notice => "Message Sent!"
    rescue ActiveRecord::RecordInvalid => e
      redirect_to compose_profile_messages_path, :alert => e.message
    end
  end

  def sent
		@messages = current_user.sent_messages.page(params[:page]).per(20)
  end

  def compose
		@friends = current_user.friends
    redirect_to profile_path, :alert => "You currently have no friends. Please add some friends to use this feature." if @friends.empty?
  end

  private

  def load_user_message
    @user_message = UserMessage.find(params[:id])
  end
end
