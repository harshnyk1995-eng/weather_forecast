class GeocodeService
  require "ostruct"
  def self.call(address)
    results = Geocoder.search(address)
    raise IOError, "Geocoder error or empty response" if results.blank?

    location = results.first
    raise IOError, "Invalid Geocoder result" if location.latitude.blank? || location.longitude.blank?

    geocode = OpenStruct.new(
      latitude: location.latitude.to_f,
      longitude: location.longitude.to_f,
      country_code: location.country_code || "unknown",
      postal_code: location.postal_code || "unknown"
    )

    geocode
  rescue => e
    Rails.logger.error("GeocodeService error: #{e.message}")
    raise
  end
end
