class City < ApplicationRecord
  has_many :weather_forecasts
  reverse_geocoded_by :latitude, :longitude, language: :ja
  after_validation :reverse_geocode
end
