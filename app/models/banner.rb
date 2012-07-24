class Banner < ActiveRecord::Base
  belongs_to :user
	mount_uploader :image, BannerUploader
	validates :image, :presence => true
end
