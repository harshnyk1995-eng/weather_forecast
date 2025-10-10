require "test_helper"
require "ostruct"

class WeatherServiceTest < ActiveSupport::TestCase
  test "call with known parameters" do
    latitude = 37.331669
    longitude = -122.030098
    weather = WeatherService.call(latitude, longitude)
    assert_equal 15.59, weather[:temp]
    assert_equal 15.59, weather[:temp_max]
    assert_equal 15.59, weather[:temp_min]
    assert_equal "clear sky", weather[:description]
  end
end
