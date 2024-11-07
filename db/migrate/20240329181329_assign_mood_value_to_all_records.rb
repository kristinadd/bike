class AssignMoodValueToAllRecords < ActiveRecord::Migration[7.1]
  def change
    rides = Ride.all
    rides.update_all(mood: "great")
  end
end
