class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :submission_status
      t.string :title
      t.integer :artist_age_at_creation
      t.string :optional_details

      t.timestamps
    end
  end
end
