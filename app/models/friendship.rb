class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
	
	
	def search_username(username)
		self.where("username LIKE ? AND user_id != ?", "%#{username}%", "#{self.id}")
	end
end
