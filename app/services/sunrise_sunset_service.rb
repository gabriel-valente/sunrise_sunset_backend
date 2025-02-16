require "net/http"
require "json"

class SunriseSunsetService
  SUNSET_SUNRISE_URL = "https://api.sunrisesunset.io/json"
  OPEN_STREET_MAP_URL = "https://nominatim.openstreetmap.org/search"

  def self.fetch_data(location, start_date, end_date)
    latitude, longitude = get_coordinates(location)

    return { "status" => "ERROR", "body" => "INVALID_LOCATION" } if latitude.nil? || longitude.nil?

    url = URI("#{SUNSET_SUNRISE_URL}?lat=#{latitude}&lng=#{longitude}&date_start=#{start_date}&date_end=#{end_date}")    
    response = Net::HTTP.get(url)
    
    JSON.parse(response)
  end

  def self.get_coordinates(city)
    geocode_url = URI("#{OPEN_STREET_MAP_URL}?q=#{URI.encode_www_form_component(city)}&format=json&limit=1")

    response = Net::HTTP.get(geocode_url)
    data = JSON.parse(response)

    if data.empty?
      [nil, nil]
    else
      [data.first["lat"], data.first["lon"]]
    end
  end
end
