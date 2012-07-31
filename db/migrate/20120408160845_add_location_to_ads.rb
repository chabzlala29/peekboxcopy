class AddLocationToAds < ActiveRecord::Migration
  def change
    add_column :ads, :location, :string
  end
end
