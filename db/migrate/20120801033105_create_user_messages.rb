class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.belongs_to :user
      t.belongs_to :message
      t.string :type_message
      t.string :status
      t.string :label
      t.timestamps
    end
  end
end
