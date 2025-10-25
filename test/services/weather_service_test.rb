require "test_helper"
require "minitest/mock"

class WeatherServiceTest < ActiveSupport::TestCase
  test "call with known parameters" do
    latitude = 37.331669
    longitude = -122.030098
    fake_weather = {
      temp: 14.52,
      temp_max: 15.59,
      temp_min: 15.59,
      description: "clear sky"
    }

    WeatherService.stub(:call, fake_weather) do
      weather = WeatherService.call(latitude, longitude)
      assert_equal 14.52, weather[:temp]
      assert_equal 15.59, weather[:temp_max]
      assert_equal 15.59, weather[:temp_min]
      assert_equal "clear sky", weather[:description]
    end
  end
end
