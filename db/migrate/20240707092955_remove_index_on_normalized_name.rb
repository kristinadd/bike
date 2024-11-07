class RemoveIndexOnNormalizedName < ActiveRecord::Migration[7.1]
  def change
    # Remove the unique index on the normalized name column
    remove_index :destinations, name: 'index_destinations_on_normalized_name'
    
    # Remove the normalized name column
    remove_column :destinations, :normalized_name
  end
end
