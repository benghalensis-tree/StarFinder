class ChangeDateColumnInWeatherForecasts < ActiveRecord::Migration[6.1]
  def up
    change_column :weather_forecasts, :date, :date
  end

  def down
    change_column :weather_forecasts, :date, :datetime
  end
end