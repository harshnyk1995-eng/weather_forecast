Weather Forecast App (Rails)

A Ruby on Rails application that allows users to fetch real-time weather forecasts for any location. The app integrates with OpenWeather API and uses Geocoder to convert addresses or ZIP codes into geographic coordinates.

Key Features:

Enter a city name or postal code to retrieve the current weather.

Displays:

Temperature (current, high, and low)

Weather conditions (description)

Cache indicator (API vs. cached results)

Caches forecast data for 30 minutes to reduce API calls.

Graceful error handling for invalid locations or API failures.

Simple, responsive UI built with Rails’ default views.

Technologies Used:

Ruby on Rails 8

Geocoder gem for geolocation

HTTParty for API requests

OpenWeather API for weather data

Rails caching for optimized performance

Usage:

Clone the repository.

Add your OpenWeather API key in credentials.yml.enc:

openweather:
  api_key: YOUR_API_KEY


Run migrations (if any) and start the Rails server:

rails server


Navigate to http://localhost:3000, enter a city or ZIP code, and view the forecast.
