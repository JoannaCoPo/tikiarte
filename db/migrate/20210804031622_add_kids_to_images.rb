class AddKidsToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :kid, null: false, foreign_key: true
  end
end
