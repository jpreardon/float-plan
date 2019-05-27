class CreateCrewPlanJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :crew_plans, id: false do |t|
      t.integer :crew_id
      t.integer :plan_id
    end
    
    add_index :crew_plans, :crew_id
    add_index :crew_plans, :plan_id
  end
end