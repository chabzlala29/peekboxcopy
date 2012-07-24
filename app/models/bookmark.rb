class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :peekme, :class_name => "Event", :foreign_key => "event_id" 
end
