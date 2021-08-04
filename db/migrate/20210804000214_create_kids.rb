class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string :first_name
      t.string :last_name
      t.string :optional_details

      t.timestamps
    end
  end
end
