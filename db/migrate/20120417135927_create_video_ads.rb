class CreateVideoAds < ActiveRecord::Migration
  def change
    create_table :video_ads do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
