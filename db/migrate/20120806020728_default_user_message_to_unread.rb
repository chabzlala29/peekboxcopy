class DefaultUserMessageToUnread < ActiveRecord::Migration
  def up
    #change_column :user_messages, :status, :string, :default => "unread"
    UserMessage.update_all(:status => :unread)
    add_index :user_messages, [:user_id, :status], :name => "user_id_status_idx"
  end

  def down
    remove_index :user_messages, :name => :user_id_status_idx
  end
end
