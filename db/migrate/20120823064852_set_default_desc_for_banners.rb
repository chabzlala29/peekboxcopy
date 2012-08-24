class SetDefaultDescForBanners < ActiveRecord::Migration
  def up
    Banner.update_all(:description => "This is a test description!")
  end
end
