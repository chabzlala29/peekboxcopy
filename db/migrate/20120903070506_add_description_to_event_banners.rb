class AddDescriptionToEventBanners < ActiveRecord::Migration
  def change
    add_column :event_banners, :description, :text
  end
end
