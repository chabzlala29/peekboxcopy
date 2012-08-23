class Profile::MessagesController < Profile::ProfileController

  autocomplete :user, :username

  before_filter :load_user_message, :only => :destroy


  def inbox
		@messages = current_user.received_messages.page(params[:page]).per(20)
  end

  def show
  end

  def destroy
    raise Exception if @user_message.user != current_user
    @user_message.destroy
    redirect_to request.referer, :notice => "Delete Success!"
  end

  def delete_checked
    message_ids = params[:user_message_ids]
    message_ids.each do |user_message|
      message = UserMessage.find(user_message)
      message.update_attribute(:status, 'deleted')
      message.update_attribute(:deleted_at, Time.now)
    end

    flash[:notice] = 'Successfully deleted!'
    redirect_to request.referer
  end

  def move_to_label
    user_message = UserMessage.find(params[:id])
    user_message.update_attributes(:label => params[:label])
    redirect_to request.referer, :notice => "Successfully Updated!"
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

  def trash
    @messages_tinbox = current_user.trash_messages_tinbox.page(params[:page]).per(20)
    @messages_tsent = current_user.trash_messages_tsent.page(params[:page]).per(20)
  end

  def compose
		@friends = current_user.friends
    redirect_to profile_path, :alert => "You currently have no friends. Please add some friends to use this feature." if @friends.empty?
  end

  def get_autocomplete_items(parameters)
    items = super(parameters)
    items= items.where("users.id IN(?)", current_user.friends)
  end

  private

  def load_user_message
    @user_message = UserMessage.find(params[:id])
  end


end
