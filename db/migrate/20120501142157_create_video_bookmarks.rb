class CreateVideoBookmarks < ActiveRecord::Migration
  def change
    create_table :video_bookmarks do |t|
      t.references :user
      t.references :video

      t.timestamps
    end
    add_index :video_bookmarks, :user_id
    add_index :video_bookmarks, :video_id
  end
end
