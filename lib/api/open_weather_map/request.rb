module Api
  module OpenWeatherMap
    class Request
      attr_accessor :query

      def initialize(latitude, longitude)
        @query = {
          lat: latitude,
          lon: longitude,
          units: 'metric',
          appid: ENV['OPEN_WEATHER_ID']
        }
      end

      def request
        client = HTTPClient.new
        request = client.get("https://api.openweathermap.org/data/3.0/onecall", query) 
        JSON.parse(request.body)
      end

      def self.attributes_for(attrs)
        date = Time.at(attrs['dt']).in_time_zone('Tokyo').to_date
        {
          weather_id: attrs['weather'][0]['id'],
          icon: attrs['weather'][0]['icon'],
          clouds: attrs['clouds'],
          temp_min: attrs['temp']['min'],
          temp_max: attrs['temp']['max'],
          humidity: attrs['humidity'],
          wind_speed: attrs['wind_speed'],
          pop: attrs['pop'],
          date: date,
        }
      end
    end
  end
end
