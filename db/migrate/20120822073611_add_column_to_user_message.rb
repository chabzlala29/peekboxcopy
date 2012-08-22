class AddColumnToUserMessage < ActiveRecord::Migration
  def up
    add_column :user_messages, :deleted_at, :datetime
  end
end
