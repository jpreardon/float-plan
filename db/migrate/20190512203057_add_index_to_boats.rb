class AddIndexToBoats < ActiveRecord::Migration[5.2]
  def change
    add_index :boats, :number, unique: true
  end
end
