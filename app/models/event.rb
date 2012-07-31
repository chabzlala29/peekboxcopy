class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
	mount_uploader :image, EventUploader

	validates_presence_of :user
	validates_presence_of :title
	validates_presence_of :description
	scope :for_page, order(:created_at).limit(3).reverse_order
	scope :featured, where(:featured => true)
	scope :special, where(:featured => false, :special => true)
	scope :non_featured_non_special, where(:featured => false, :special => false)
	scope :non_featured, non_featured_non_special.order("created_at").reverse_order
end
