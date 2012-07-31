class AddShoutoutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shoutout, :string
  end
end
