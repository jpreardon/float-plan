class ChangeDateFieldsOnPlans < ActiveRecord::Migration[5.2]
  def up
    add_column :plans, :date, :date
    change_column :plans, :time_out, :time
    change_column :plans, :time_in, :time
  end
  
  def down
    change_column :plans, :time_in, :datetime
    change_column :plans, :time_out, :datetime
    remove_column :plans, :date
  end
end