class AddThumbnailToVideoAd < ActiveRecord::Migration
  def change
    add_column :video_ads, :thumbnail, :string
  end
end
