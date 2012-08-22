class ResetToUndelete < ActiveRecord::Migration
  def up
    UserMessage.update_all(:status => "")
  end
end
