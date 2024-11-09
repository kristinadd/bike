require 'json'

class DistanceCalculatorService
  PROMPT = "
            The use will provide you with two city names. 
            Calculate the distance between the two cities. 
            Convert the calculated distance to kilometers (if not already in kilometers) 
            and only return the distance as an integer, 
            without any additional sentences or characters.
            "

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