class AddUserToRides < ActiveRecord::Migration[7.1]
  def change
    add_reference :rides, :user, null: true, foreign_key: true
  end
end
