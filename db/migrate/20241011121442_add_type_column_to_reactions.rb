class AddTypeColumnToReactions < ActiveRecord::Migration[7.1]
  def change
    add_column :reactions, :reaction_type, :string, null: true
  end
end
