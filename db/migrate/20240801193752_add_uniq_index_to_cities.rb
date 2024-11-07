class AddUniqIndexToCities < ActiveRecord::Migration[7.1]
  def change
    add_index :cities, :name, unique: true
  end
end
