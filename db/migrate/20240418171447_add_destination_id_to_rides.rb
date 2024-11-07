class AddDestinationIdToRides < ActiveRecord::Migration[7.1]
  def change
    add_column(:rides, :destination_id, :integer)
  end
end
