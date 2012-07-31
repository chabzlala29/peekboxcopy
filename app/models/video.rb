class Video < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :contest
	has_one :eligibility_code
	has_many :comments
	has_many :thumbnails
  has_many :video_bookmarks
	mount_uploader :media, MediaUploader
	attr_accessible :media
	paginates_per 21

	validates_presence_of :category
	validates_presence_of :user
	validates_presence_of :media

	scope :processed, where(:processed => true)
	scope :featured, processed.where(:featured => true)
	scope :for_page, order(:created_at).limit(3).reverse_order

	def processed!
		update_attribute(:processed, true)
	end
	
end
