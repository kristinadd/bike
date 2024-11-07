class AddDescriptionToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :description, :string
  end
end
