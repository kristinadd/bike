class AddRecomendationsToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column(:destinations, :recomendations, :json)
  end
end
