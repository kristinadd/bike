class CityImageJob
  include Sidekiq::Job

  # Specifically, Sidekiq requires that all job arguments be serializable to JSON. 
  # This means you can only pass simple data types such as integers, strings, arrays, 
  # hashes, and other native JSON types as arguments to Sidekiq jobs. Passing an 
  # ActiveRecord object (like a City object) directly is not allowed because it cannot be serialized into JSON. 
  def perform(city_name)
    @city = City.find_by(name: city_name)
      return unless @city
   GenerateCityImage.new.call(@city)
  end
end
