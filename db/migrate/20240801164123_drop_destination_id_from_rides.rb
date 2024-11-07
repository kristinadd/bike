class DropDestinationIdFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :destination_id, :integer
  end
end
