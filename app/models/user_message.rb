class UserMessage < ActiveRecord::Base
  belongs_to :messages, :class_name => "Message", :foreign_key => "message_id"
  
end
