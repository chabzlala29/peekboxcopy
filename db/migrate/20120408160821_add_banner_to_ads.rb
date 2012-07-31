class AddBannerToAds < ActiveRecord::Migration
  def change
    add_column :ads, :banner, :string
  end
end
