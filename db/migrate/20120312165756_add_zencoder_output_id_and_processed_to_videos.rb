class AddZencoderOutputIdAndProcessedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :zencoder_output_id, :string
    add_column :videos, :processed, :boolean
  end
end
