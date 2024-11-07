class Ride < ApplicationRecord
  has_many :reactions, dependent: :destroy

  belongs_to :start_city, class_name: 'City'
  belongs_to :end_city, class_name: 'City'
  belongs_to :user, optional: true
  # Without optional: true: Rails assumes that the association is mandatory, meaning that a Ride must have a User. If you try to create a Ride without a user_id, Rails will trigger a validation error, even if the column is nullable in the database.
  # With optional: true: You explicitly tell Rails that this association is optional, allowing the Ride to be created without a user_id.
  validates :name, :start_city, :end_city, presence: true

  def generate_restaurant_recommendations
    if start_city && end_city
      service = RestaurantRecommendationService.new
      service.call(self.start_city.name, self.end_city.name)
    else
      return
    end
  end

  def calculate_distance
    if start_city && end_city
      service = DistanceCalculatorService.new
      service.call(self.start_city.name, self.end_city.name)
      # can omit self, but this helps to show that the method is called on the instance of the class
    else
      return
    end
  end

  def reaction_status(user)
    reaction = reactions.find_by(user_id: user.id)
    if reaction
      "You've already reacted!"
    else
      "No reaction yet."
    end
  end
end
