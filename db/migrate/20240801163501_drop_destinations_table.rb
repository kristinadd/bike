class DropDestinationsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :destinations
  end
end
