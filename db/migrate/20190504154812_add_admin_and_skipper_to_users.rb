class AddAdminAndSkipperToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :skipper, :boolean, default: false
  end
end
