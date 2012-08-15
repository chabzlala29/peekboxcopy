class UserMessage < ActiveRecord::Base
  VALID_STATUSES = %w{read unread deleted}
  READ    = "read"
  UNREAD  = "unread"
  DELETED = "deleted"
  LABELS = {:important => "Important", :business => "Business", :personal => "Personal"}


  belongs_to :user
  belongs_to :message, :class_name => "Message", :foreign_key => "message_id"
  
  attr_accessible :type_message, :message_id, :friend_id, :user_id, :status, :label
  validates_inclusion_of :status, :in => VALID_STATUSES

  scope :read, where(:status => 'read')
  scope :unread, where(:status => 'unread')

  def body
    message.message
  end

  def destroy
    message_ids = params[:user_message_ids].collect {|id| id.to_i} if params[:user_message_ids]

    message_ids.each do |id|
      self.update_attribute(:status, 'deleted')
    end
  end
end
