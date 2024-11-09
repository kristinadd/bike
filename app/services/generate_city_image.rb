require 'open-uri'
class GenerateCityImage
  PROMPT = "Generate an image visualizing the city given by the user:"
  
  def client
    client = OpenAI::Client.new(
      access_token: ENV["OPENAI_API_KEY"],
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
    )
  end

  def call(city)
    response = client.images.generate(parameters: { prompt: PROMPT + city.name, model: "dall-e-3", size: "1024x1792", quality: "standard" })
    image_url =  response.dig("data", 0, "url")
    download_image(image_url, city)
    # => "https://oaidalleapiprodscus.blob.core.windows.net/private/org-Rf437IxKhh..."
  end

  def download_image(image_url, city)
    read_image = URI.parse(image_url).read
    File.open(Rails.root.join("public/city_images/#{city.id}.png"), 'wb') do |file|
      file.write read_image
    end
  end
end
