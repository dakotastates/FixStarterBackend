class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_level, :integer, default: 0
  end
end
