class AddLastActivityDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_activity_date, :datetime
  end
end
