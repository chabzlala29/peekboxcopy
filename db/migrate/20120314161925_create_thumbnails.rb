class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :url
      t.references :video

      t.timestamps
    end
    add_index :thumbnails, :video_id
  end
end
