namespace :open_weather_api do
  desc 'Requests and save in database'
  task weather_forecasts: :environment do
    City.all.each do |city|
     
      open_weather = Api::OpenWeatherMap::Request.new(city.latitude, city.longitude)
      response = open_weather.request

      8.times do |i|
        params = Api::OpenWeatherMap::Request.attributes_for(response['daily'][i])
        if weather_forecast = WeatherForecast.where(city_id: city.id, date: params[:date]).presence
          weather_forecast[0].update!(params)
        else       
          city.weather_forecasts.create!(params)
        end
      end
    end
    puts 'completed!'
  end
end
