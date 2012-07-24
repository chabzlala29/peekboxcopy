class ChangeProcessedFromVideoAds < ActiveRecord::Migration
  def up
		remove_column :video_ads, :processed
		add_column :video_ads, :processed, :boolean, :default => false
  end

  def down
  end
end
