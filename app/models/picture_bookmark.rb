class PictureBookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture_marked, :class_name => "Picture", :foreign_key => "picture_id" 
end
