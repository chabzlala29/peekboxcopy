class AddTitleToEventBanners < ActiveRecord::Migration
  def change
    add_column :event_banners, :title, :string
  end
end
