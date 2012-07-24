class RenameNameToTitleFromAds < ActiveRecord::Migration
  def change
		rename_column :ads, :name, :title
  end

  def down
  end
end
