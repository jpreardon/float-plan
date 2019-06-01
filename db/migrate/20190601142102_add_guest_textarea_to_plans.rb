class AddGuestTextareaToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :guests, :text
  end
end
