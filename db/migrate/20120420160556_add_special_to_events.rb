class AddSpecialToEvents < ActiveRecord::Migration
  def change
    add_column :events, :special, :boolean, :default => false
  end
end
