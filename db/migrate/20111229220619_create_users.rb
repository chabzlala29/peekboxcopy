class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
#      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
			t.text	 :location
			t.string :occupation
			t.string :website
			t.boolean :sex
			t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
