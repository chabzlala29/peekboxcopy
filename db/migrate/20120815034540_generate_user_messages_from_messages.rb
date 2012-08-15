class GenerateUserMessagesFromMessages < ActiveRecord::Migration
  def up
    Message.all.each do |message|
      if message.friend_id.present?
        message.user_messages.create!(:type_message => "sender", :user_id => message.user_id)
        message.user_messages.create!(:type_message => "recipient", :user_id => message.friend_id)
      end
    end
  end
end
