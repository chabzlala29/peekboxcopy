class ChangeSexBooleanToSexString < ActiveRecord::Migration
  def up
		remove_column :users, :sex
		add_column :users, :sex, :string
  end

  def down
  end
end
