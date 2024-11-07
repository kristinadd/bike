class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.belongs_to  :user
      t.belongs_to :ride

      t.timestamps
    end

    add_index :reactions, [:user_id, :ride_id], unique: true
  end
end
