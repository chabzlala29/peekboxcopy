class CreateEventBanners < ActiveRecord::Migration
  def change
    create_table :event_banners do |t|
      t.string :image

      t.timestamps
    end
  end
end
