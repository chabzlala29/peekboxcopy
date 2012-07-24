class Message < ActiveRecord::Base
  belongs_to :user
	belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

	scope :from_inbox, where(:message_type => "inbox")
	scope :from_sent, where(:message_type => "sent")
end
