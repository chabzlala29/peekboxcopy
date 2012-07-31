class CreateAdsStates < ActiveRecord::Migration
  def change
    create_table :ads_states do |t|
      t.boolean :active
      t.references :ads

      t.timestamps
    end
    add_index :ads_states, :ads_id
  end
end
