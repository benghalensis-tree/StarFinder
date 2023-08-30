class StarLightsController < ApplicationController

  def show
    @star_light = StarLight.find(params[:id])
    lat_sec = @star_light.latitude * 3600
    lon_sec = @star_light.longitude * 3600
    @hotels = RakutenWebService::Travel::Hotel.search(latitude: lat_sec.round(2), longitude: lon_sec.round(2), searchRadius: 3)
  end

end
