class ChangeRideColumnsToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:rides, :distance, false)
  end
end

# I had to migrate all existing record without 
# distance values to have some value