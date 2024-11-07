class AddValuesToUserIdInRides < ActiveRecord::Migration[7.1]
  def up
    user = User.find_by(id: 13)
    return unless user

    rides = Ride.where(user_id: nil)
    # return unless rides
    # The where clause in ActiveRecord always returns an ActiveRecord::Relation object, even if no records are found. This means rides will never be nil, but it could be an empty relation. Therefore, you can skip the conditional check for the rides.

    rides.each do |ride|
      ride.update!(user_id: user.id)
      Rails.logger.info("Record: #{ride.id} updated with user_id: #{user.id}.")
    end
  end

  def down
    rides = Ride.where(user_id: 13)

    rides.each do |ride|
      ride.update!(user_id: nil)
    end
  end
end
