class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :friend
      t.text :message
      t.string :message_type

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :friend_id
  end
end
