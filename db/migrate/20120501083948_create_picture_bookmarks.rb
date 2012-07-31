class CreatePictureBookmarks < ActiveRecord::Migration
  def change
    create_table :picture_bookmarks do |t|
      t.references :user
      t.references :picture

      t.timestamps
    end
    add_index :picture_bookmarks, :user_id
    add_index :picture_bookmarks, :picture_id
  end
end
