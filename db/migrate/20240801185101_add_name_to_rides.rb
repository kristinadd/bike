class AddNameToRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :name, :string
  end
end
