require "test_helper"

class WeatherServiceTest < ActiveSupport::TestCase
  test "call with known parameters" do
    def setup
      stub_request(:get, /api.openweathermap.org/).to_return(
        body: {
          "main" => { "temp" => 25, "temp_max" => 30, "temp_min" => 20 },
          "weather" => [ { "description" => "clear sky" } ]
        }.to_json,
        headers: { "Content-Type" => "application/json" }
      )
    end

    latitude = 37.331669
    longitude = -122.030098
    weather = WeatherService.call(latitude, longitude)
    assert_includes -4..44, weather.temperature
    assert_includes -4..44, weather.temperature_min
    assert_includes -4..44, weather.temperature_max
    assert_includes 0..100, weather.humidity
    assert_includes 900..1100, weather.pressure
    refute_empty weather.description
  end
end
