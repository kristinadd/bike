class AddUniqIndexToDestinationsName < ActiveRecord::Migration[7.1]
  def change
    add_index :destinations, :name, unique: true
  end
end
