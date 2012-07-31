class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :image
      t.references :user

      t.timestamps
    end
    add_index :banners, :user_id
  end
end
