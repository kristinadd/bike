class CityDescriptionJob
  include Sidekiq::Job

  def perform(city_id)
    @city = City.find_by(id: city_id)       # it will return nil instead of raising an exception
    return unless @city                     # Safeguard in case the city is not found

    @city.description = @city.generate_city_description
    @city.save
  end
end
