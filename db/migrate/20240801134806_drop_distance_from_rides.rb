class DropDistanceFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :distance, :float
   end
end
