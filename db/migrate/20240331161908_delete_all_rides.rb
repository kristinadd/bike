class DeleteAllRides < ActiveRecord::Migration[7.1]
  def change
    rides = Ride.all
    rides.destroy_all
  end
end
