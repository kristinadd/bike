class UpdateDestinationToHaveRecomendations < ActiveRecord::Migration[7.1]
  DESTINATION = Destination.find_by(name: "Edinburgh")

  def change
    destinations_without_recomendations = Destination.where(recomendations: []).or (Destination.where(recomendations: nil))

    destinations_without_recomendations.each do |destination|
      destination.update(name: DESTINATION)
    end
  end
end
