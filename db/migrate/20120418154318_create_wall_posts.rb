class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.references :user
      t.integer :poster_id
      t.string :post

      t.timestamps
    end
    add_index :wall_posts, :user_id
  end
end
