class Message < ActiveRecord::Base
  belongs_to :user
	belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

  validates_presence_of :message
  has_attached_file :attachment

  after_create :create_user_message

  private

  def create_user_message
    UserMessage.create!(:user_id => user.id,   :message_id => self.id, :type => "sender")
    UserMessage.create!(:user_id => friend.id, :message_id => self.id, :type => "recipient")
  end
end
