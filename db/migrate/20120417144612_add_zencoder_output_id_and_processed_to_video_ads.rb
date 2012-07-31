class AddZencoderOutputIdAndProcessedToVideoAds < ActiveRecord::Migration
  def change
    add_column :video_ads, :zencoder_output_id, :integer
    add_column :video_ads, :processed, :boolean
  end
end
