class ChangeMoodColumnToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:rides, :mood, false)
  end
end

# had to migrate data before running the migration