class City < ApplicationRecord
  has_many :weather_forecasts
end
