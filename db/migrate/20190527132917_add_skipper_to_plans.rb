class AddSkipperToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :plans, :skipper, foreign_key: { to_table: :users } 
  end
end