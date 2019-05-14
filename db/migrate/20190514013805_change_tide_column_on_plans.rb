class ChangeTideColumnOnPlans < ActiveRecord::Migration[5.2]
  def change
    change_table :plans do |t|
      t.rename :tide, :current
    end
  end
end
