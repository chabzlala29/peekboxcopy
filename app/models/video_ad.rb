class VideoAd < ActiveRecord::Base
	attr_accessible :media
	mount_uploader :media, VideoAdsUploader
	paginates_per 21
	validates	 :title, :presence => true
	validates	 :media, :presence => true
	scope :processed, where(:processed => true)

	def processed!
		update_attribute(:processed, true)
	end
end
