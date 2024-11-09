require 'json'

class RestaurantRecommendationService
  PROMPT = "Act like a bicycle ride recommendation service. 
            The user will give you two city  name, and you will return a list of the top 3 most famous restaurants that are located on the road between the two cities that the user provided you with.

            Always respond with valid JSON structure and without any additional text, follow this JSON format: 

              { 
              name:  the name of the restaurant, 
              description:  short interesting info about the restaurant, and it's most famous dish 
              }"

  def client
    client = OpenAI::Client.new(
      access_token: ENV["OPENAI_API_KEY"],
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
    )
  end

  def call(start_city, end_city)
    response = client.chat(
      parameters: {
          model: "gpt-4o",
          messages: [
                    { role: "user", content: "The cities are:  #{start_city} and #{end_city}"}, 
                    { role: "system", content: PROMPT}
                  ],
          temperature: 0.7,})
    json_response = response.dig("choices", 0, "message", "content")
    json_response.gsub!(/```json|```/, '')  # using Regular Expression / chars to be removed are added here /   single pipe | means OR
    Rails.logger.info(json_response)
    JSON.parse(json_response)
  end
end
