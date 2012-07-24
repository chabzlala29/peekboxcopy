class RenameLocationToDescriptionFromAlbums < ActiveRecord::Migration
  def change
		rename_column :albums, :location, :description
  end

  def down
  end
end
