require 'json'

class CityDescriptionService
  PROMPT = "You are an expert in world cities and cultures. The user will provide the name of a city,
            and you will return a brief description of the city along with its most interesting and curious facts. 
            The information should be engaging, informative, and concise. Make sure to include both historical and modern aspects of the city if applicable.

            Please provide a description and interesting facts about this city in the form of a single, well-structured paragraph. 
            The paragraph needs to be wrapt in a string object, so it can be saved to the database."

  def client
    client = OpenAI::Client.new(
      access_token: ENV["OPENAI_API_KEY_CITY_DESCRIPTION"],
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
    )
  end

  def call(destination)
    response = client.chat(
      parameters: {
          model: "gpt-4o",
          messages: [
                    { role: "user", content: "The city is:  #{destination}"}, 
                    { role: "system", content: PROMPT}
                  ],
          temperature: 0.7,})
    json_response = response.dig("choices", 0, "message", "content")
    json_response.gsub!(/```json|```/, '')  # using Regular Expression / chars to be removed are added here / single pipe | means OR
    Rails.logger.info(json_response)
    JSON.parse(json_response)
  end
end
