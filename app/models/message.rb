class Message < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :message
  has_attached_file :attachment
  has_many :user_messages
  has_many :recipient_users, :through => :user_messages, :source => :user, :conditions => {"user_messages.type_message" => "recipient"}

  after_create :create_user_message

  attr_accessor :recipients

  def create_user_message
    UserMessage.create!(:user_id => user.id, :message_id => self.id, :type_message => "sender")
    @recipients.each do |recipient|
      add_recipient(recipient)
    end
  end

  def add_recipient(recipient)
    user_id = User.find_by_username(recipient).id
    UserMessage.create!(:user_id => user_id, :message_id => self.id, :type_message => "recipient")
  end
end
