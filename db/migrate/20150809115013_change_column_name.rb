class ChangeColumnName < ActiveRecord::Migration
  def change
  	change_table :Spots do |t|
      t.rename :x, :position_x
      t.rename :y, :position_y
    end
  end
end
