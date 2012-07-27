class Message < ActiveRecord::Base
  belongs_to :user
	belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

  def self.get_inbox(user)
    self.where(:friend_id => user.id)
  end
end
