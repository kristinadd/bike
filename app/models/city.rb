class City < ActiveRecord::Base
  validates :name, presence:true, uniqueness: true

  has_many :start_rides, class_name: Ride.name, foreign_key: 'start_city_id', dependent: :destroy
  has_many :end_rides, class_name: Ride.name, foreign_key: 'end_city_id', dependent: :destroy
  
  def generate_city_description
    service = CityDescriptionService.new
    service.call(self.name)
  end

  def generate_city_image
    service = GenerateCityImage.new
    service.call(self)
  end

  def count_words
    if description.present?
      description.split.count
    end
  end
end
