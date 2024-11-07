class DropLocationFromDestinations < ActiveRecord::Migration[7.1]
  def change
    remove_column(:destinations, :location, :json)
  end
end
