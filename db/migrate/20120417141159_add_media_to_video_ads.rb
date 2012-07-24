class AddMediaToVideoAds < ActiveRecord::Migration
  def change
    add_column :video_ads, :media, :string
  end
end
