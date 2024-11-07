class DropDestinationFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column(:rides, :destination, :string)
  end
end
