namespace :open_weather_api do
  desc 'Requests and save in database'
  task weather_forecasts_1: :environment do
    City.all[0..46].each do |city|
     
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
    puts "completed! weather_forecasts_1 #{Time.now}"
  end
  task weather_forecasts_2: :environment do
    City.all[47..93].each do |city|
     
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
    puts "completed! weather_forecasts_2 #{Time.now}"
  end
  task weather_forecasts_3: :environment do
    City.all[94..140].each do |city|
     
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
    puts "completed! weather_forecasts_3 #{Time.now}"
  end
end
