class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.datetime :time_out
      t.text :weather_forecast
      t.string :tide
      t.string :direction
      t.boolean :checkout_complete
      t.text :notes_out
      t.datetime :time_in
      t.boolean :checkin_complete
      t.text :notes_in

      t.timestamps
    end
  end
end
