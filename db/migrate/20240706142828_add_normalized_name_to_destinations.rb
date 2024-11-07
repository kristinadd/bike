class AddNormalizedNameToDestinations < ActiveRecord::Migration[7.1]
  def change
    # Add a new column for the normalized name
    add_column :destinations, :normalized_name, :string

    # Add an index on the normalized name
    add_index :destinations, :normalized_name, unique: true
  end
end
