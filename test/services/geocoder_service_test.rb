require "test_helper"

class GeocodeServiceTest < ActiveSupport::TestCase
  test "call with known address" do
    # Save original search method
    original_search = Geocoder.method(:search)

    # Stub Geocoder.search temporarily
    Geocoder.define_singleton_method(:search) do |_address|
      [ Struct.new(:latitude, :longitude, :country_code, :postal_code).new(
        12.97, 77.59, "IN", "560001"
      ) ]
    end

    result = GeocodeService.call("Bangalore")

    assert_equal 12.97, result[:latitude]
    assert_equal 77.59, result[:longitude]
    assert_equal "IN", result[:country_code]
    assert_equal "560001", result[:postal_code]
  ensure
    # Restore original method
    Geocoder.define_singleton_method(:search, original_search)
  end
end
