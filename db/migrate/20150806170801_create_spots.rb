class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :x
      t.integer :y

      t.timestamps null: false
    end
  end
end
