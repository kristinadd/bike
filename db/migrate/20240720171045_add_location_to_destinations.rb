class AddLocationToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column(:destinations, :location, :json)
  end
end
