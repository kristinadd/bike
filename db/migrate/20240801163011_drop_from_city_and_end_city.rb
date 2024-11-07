class DropFromCityAndEndCity < ActiveRecord::Migration[7.1]
  def change
    remove_column :rides, :from_city, :string
    remove_column :rides, :to_city, :string
  end
end
