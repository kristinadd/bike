class AddFromCityAndToCityToRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :from_city, :string, null: false
    add_column :rides, :to_city, :string, null: false
  end
end
