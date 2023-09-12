class StarLightsController < ApplicationController

  def show
    @star_light = StarLight.find(params[:id])
    lat_sec = @star_light.latitude * 3600
    lon_sec = @star_light.longitude * 3600
    @hotels = RakutenWebService::Travel::Hotel.search(latitude: lat_sec.round(2), longitude: lon_sec.round(2), searchRadius: 3)
    date = Date.today
    city = City.near([@star_light.latitude, @star_light.longitude], 100).first
    @weather_forecasts = []
    if city.present?
      for i in 0..7 do
        @weather_forecasts[i] = city.weather_forecasts.find_by(date: date)
        date += 1
      end
    end
  end

end
