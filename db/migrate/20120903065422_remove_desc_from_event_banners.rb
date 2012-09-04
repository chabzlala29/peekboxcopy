class RemoveDescFromEventBanners < ActiveRecord::Migration
  def up
    remove_column :event_banners, :desc
  end

  def down
    add_column :event_banners, :desc, :string
  end
end
