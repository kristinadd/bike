class AddRecommendationToRides < ActiveRecord::Migration[7.1]
  def change
    add_column :rides, :recommendation, :json
  end
end
