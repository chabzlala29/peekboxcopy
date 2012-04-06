class Picture < ActiveRecord::Base
  belongs_to :album  
  belongs_to :user
	mount_uploader :image, PictureUploader
	validates_presence_of :image
end
