class UserMessage < ActiveRecord::Base

  belongs_to :messages, :class_name => "Message", :foreign_key => "message_id", :dependent => :destroy
  
  attr_accessible :type_message, :message_id, :friend_id, :user_id
  
  
end
