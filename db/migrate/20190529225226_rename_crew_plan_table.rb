class RenameCrewPlanTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :crew_plans, :crew_trips
    rename_column :crew_trips, :crew_id, :user_id
  end
end
