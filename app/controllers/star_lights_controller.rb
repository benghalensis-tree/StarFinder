class StarLightsController < ApplicationController

  def show
    @star_light = StarLight.find(params[:id])
    latitude = @star_light.latitude
    longitude = @star_light.longitude
    unless @star_light.address.present?
      address = arrange_geocoder(latitude, longitude)
      @star_light.update(address: address)
    end
    lat_sec = latitude * 3600
    lon_sec = longitude * 3600
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

  private
  
  def arrange_geocoder(latitude, longitude)
    result = Geocoder.search([latitude, longitude],language: :ja).first.data['address']
    address_arry = []
    address_arry[0] = result['province']
    address_arry[1] = result['city']
    address_arry[2] = result['county']
    address_arry[3] = result['region']
    address_arry[4] = result['quarter']
    address_arry[5] = result['town']
    address_arry[6] = result['road']
    address_arry.delete(nil)
    return address_arry.join(' ')
  end


end
