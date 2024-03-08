class CreateRides < ActiveRecord::Migration[7.1]
  def change
    create_table :rides do |t|
      t.float :distance
      t.datetime :start_at
      t.datetime :end_at
      t.string :destination
      t.string :mood

      t.timestamps
    end
  end
end
