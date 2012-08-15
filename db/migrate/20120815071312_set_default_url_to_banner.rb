class SetDefaultUrlToBanner < ActiveRecord::Migration
  def up
    Banner.update_all(:page_url => "http://google.com")
  end
end
