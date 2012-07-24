class VideoBookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :video_marked, :class_name => "Video", :foreign_key => "video_id" 
end
