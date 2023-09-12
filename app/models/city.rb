class City < ApplicationRecord
  has_many :weather_forecasts, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude
end
