class CreateEligibilityCodes < ActiveRecord::Migration
  def change
    create_table :eligibility_codes do |t|
      t.string :code
      t.boolean :taken, :default => false
      t.references :video

      t.timestamps
    end
    add_index :eligibility_codes, :video_id
  end
end
