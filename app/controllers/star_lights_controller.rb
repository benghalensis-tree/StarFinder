class StarLightsController < ApplicationController

  def show
    @star_light = StarLight.find(params[:id])
    lat_sec = @star_light.latitude * 3600
    lon_sec = @star_light.longitude * 3600
    @hotels = RakutenWebService::Travel::Hotel.search(latitude: lat_sec.round(2), longitude: lon_sec.round(2), searchRadius: 3)
    latitude = @star_light.latitude
    longitude = @star_light.longitude
    response = RestClient.get "https://api.open-meteo.com/v1/forecast?latitude=#{latitude}&longitude=#{longitude}&daily=weathercode&timezone=Asia%2FTokyo&forecast_days=7"
    @weather_data = JSON.parse(response.body)
  end

end
