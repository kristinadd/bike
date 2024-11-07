class DropMoodFromRides < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :mood, :string
  end
end
