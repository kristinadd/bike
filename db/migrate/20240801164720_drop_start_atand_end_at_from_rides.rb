class DropStartAtandEndAtFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :start_at, :datetime
    remove_column :rides, :end_at, :datetime
  end
end
