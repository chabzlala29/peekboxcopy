class Contest < ActiveRecord::Base
	has_many :videos
	scope :enabled, where(:enable => true)
	scope :disabled, where(:enable => false)
end
