class AddStatusToContest < ActiveRecord::Migration
  def change
    add_column :contests, :enable, :boolean, :default => true
  end
end
