class Add < ActiveRecord::Migration[7.1]
  def change
    add_reference :rides, :start_city, foreign_key: { to_table: :cities}
  end
end
