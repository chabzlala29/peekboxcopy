class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
  
  validates_presence_of :message
  has_attached_file :attachment
  has_many :user_messages
  after_create :create_user_message
  
  

  def create_user_message
    UserMessage.create!(:user_id => user.id,   :message_id => self.id, :type_message => "sender")
    UserMessage.create!(:user_id => friend.id, :message_id => self.id, :type_message => "recipient")
  end
end
