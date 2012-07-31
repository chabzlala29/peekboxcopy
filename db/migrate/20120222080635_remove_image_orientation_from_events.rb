class RemoveImageOrientationFromEvents < ActiveRecord::Migration
  def up
		remove_column :events, :image_orientation
  end

  def down
  end
end
