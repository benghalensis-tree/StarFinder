class MapsController < ApplicationController
  include PostsHelper

  def index
    @bests = Post.order(view_count: :desc).limit(5)
    gon.posts = @posts.map do |post|
      {
        title: post.title,
        view_count: post.view_count,
        content: post.content,
        latitude: post.latitude,
        longitude: post.longitude,
        image_url: post.image.url,
        post_url: post_url(post)
      }
    end
    
    @star_lights = StarLight.all
    gon.star_lights = @star_lights.map do |star_light|
      {
        latitude: star_light.latitude,
        longitude: star_light.longitude,
        magnitude: star_light.magnitude,
        rank: star_light.rank,
        star_light_url: star_light_url(star_light)
      }
    end
   
    @date = Date.today
    @weather_forecasts = WeatherForecast.where(date: @date)
    gon.weather_forecasts = @weather_forecasts.map do |weather_forecast|
      {
        clouds: weather_forecast.clouds,
        icon: weather_forecast.icon,
        temp_min: weather_forecast.temp_min,
        temp_max: weather_forecast.temp_max,
        humidity: weather_forecast.humidity,
        wind_speed: weather_forecast.wind_speed,
        pop: (weather_forecast.pop * 100).round,
        latitude: weather_forecast.city.latitude,
        longitude: weather_forecast.city.longitude,
      }
    end

    @moon_time = moon_time(@date)
    @day = "#{@date.month}/#{@date.day}"
    date_time = @date.strftime('%Y%m%d')
    @moon_age = MkCalendar.new("#{date_time}").moonage.round
  end

  def weather_of_date
    @select_date = params[:date].to_date
    @date = Date.today
    @day = "#{@date.month}/#{@date.day}"
    date_time = @date.strftime('%Y%m%d')
    @moon_age = MkCalendar.new("#{date_time}").moonage.round
    @moon_time = moon_time(@select_date)
    @weather_forecasts = WeatherForecast.where(date: @select_date)
    
    @weather_forecasts = @weather_forecasts.map do |weather_forecast|
      {
        clouds: weather_forecast.clouds,
        icon: weather_forecast.icon,
        temp_min: weather_forecast.temp_min,
        temp_max: weather_forecast.temp_max,
        humidity: weather_forecast.humidity,
        wind_speed: weather_forecast.wind_speed,
        pop: (weather_forecast.pop * 100).round,
        latitude: weather_forecast.city.latitude,
        longitude: weather_forecast.city.longitude,
      }
    end
    respond_to do |format|
      format.js
    end
  end

end
