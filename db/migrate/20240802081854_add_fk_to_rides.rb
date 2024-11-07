class AddFkToRides < ActiveRecord::Migration[7.1]
  def change
    add_reference :rides, :end_city, foreign_key: { to_table: :cities }
  end
end
