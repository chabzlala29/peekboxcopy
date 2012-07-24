class User < ActiveRecord::Base
	after_update :reprocess_profile, :if => :cropping?
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	mount_uploader :profilepic, ProfileUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :crop_x, :crop_y, :crop_w, :crop_h
	attr_accessor :crop_x, :crop_y, :crop_h, :crop_w

	scope :is_admin, where(:admin => true)
	scope :not_admin, where(:admin => false)
	scope :ban_list, where(:banned => true)

	validates	 :username, :uniqueness => true, :presence => true
	validates_format_of :username, :with => /^[-a-z0-9]+$/

	has_many :wall_post
	has_many :messages
	has_many :peekme, :through => :bookmarks
	has_many :bookmarks, :dependent => :destroy

	has_many :picture_marked, :through => :picture_bookmarks
	has_many :picture_bookmarks, :dependent => :destroy

	has_many :video_marked, :through => :video_bookmarks
	has_many :video_bookmarks, :dependent => :destroy

	has_many :friends, :through => :friendships
	has_many :friendships, :dependent => :destroy
	#has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
	#has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
	#has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
	#has_many :friends, :through => :friendships, :condition => "status = 'accepted'"
	has_many :events, :dependent => :delete_all
	has_many :videos, :dependent => :delete_all
	has_many :albums, :dependent => :delete_all
	has_many :pictures, :through => :albums
	has_many :comments, :dependent => :delete_all
	has_many :banners
	
	def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def profile_geometry
    img = Magick::Image::read(self.profilepic_url).first
    @geometry = {:width => img.columns, :height => img.rows }
  end

	def is_stranger(user) 
		@friendship = Friendship.where(:user_id => user, :friend_id => self.id).first
		@friendship.blank?
	end

	def is_bookmarked(event) 
		@bookmarked = Bookmark.where(:user_id => self.id, :event_id => event.id).first
		@bookmarked.blank?
	end

	def is_picture_bookmarked(picture) 
		@bookmarked = PictureBookmark.where(:user_id => self.id, :picture_id => picture.id).first
		@bookmarked.blank?
	end

	def is_video_bookmarked(video) 
		@bookmarked = VideoBookmark.where(:user_id => self.id, :video_id => video.id).first
		@bookmarked.blank?
	end

	private
  def reprocess_profile
    self.profilepic.recreate_versions!
  end

end
