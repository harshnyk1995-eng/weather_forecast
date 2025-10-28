require "net/http"
require "json"

class WeatherService
  def self.call(lat, lon)
    api_key = Rails.application.config_for(:weather)["open_weather_open_weather open_weatherapi_key"]
    raise IOError, "Missing OpenWeather API key" unless api_key

    url = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{api_key}&units=metric")
    response = Net::HTTP.get_response(url)
    data = JSON.parse(response.body) rescue {}

    main = data["main"] or raise IOError, "OpenWeather main section is missing"
    weather = data["weather"]&.first or raise IOError, "OpenWeather weather section missing"

    {
      temp: main["temp"],
      temp_max: main["temp_max"],
      temp_min: main["temp_min"],
      description: weather["description"]
    }
  end
end
