class DropUserIdFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column(:rides, :user_id, :integer)
  end
end
