class AddColumnIsAdminToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_admin, :boolean, null: true
  end
end
