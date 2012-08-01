class AddAttachmentToMessages < ActiveRecord::Migration
  def change
    add_attachment :messages, :attachment
  end
end
