class Dashboard < User
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

	def self.recent_videos(user)
		@video = user.videos.limit(3)
	end

	def self.recent_albums(user)
		@album = user.albums.limit(3)
	end

	def self.recent_events(user)
		@event = user.albums.limit(3)
	end

end
