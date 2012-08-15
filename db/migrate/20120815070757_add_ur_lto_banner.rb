class AddUrLtoBanner < ActiveRecord::Migration
  def up
    add_column :banners, :page_url, :string
  end
end
