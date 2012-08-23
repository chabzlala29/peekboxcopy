class AddColumnDescForBanners < ActiveRecord::Migration
  def up
    add_column :banners, :description, :text
  end
end
