class UserMessage < ActiveRecord::Base
  belongs_to :message, :class_name => "Message", :foreign_key => "message_id"
  
  attr_accessible :type_message, :message_id, :friend_id, :user_id
end
