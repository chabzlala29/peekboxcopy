class ChangeZencoderOutputIdFromVideoAd < ActiveRecord::Migration
  def up
		change_column :video_ads, :zencoder_output_id, :string
  end

  def down
  end
end
