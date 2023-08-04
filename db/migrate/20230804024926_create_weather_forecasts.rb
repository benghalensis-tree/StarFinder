class CreateWeatherForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_forecasts do |t|
      t.references :city, null: false, foreign_key: true
      t.integer :weather_id
      t.integer :clouds
      t.string :icon
      t.float :temp_min
      t.float :temp_max
      t.integer :humidity
      t.float :wind_speed
      t.float :pop
      t.datetime :date

      t.timestamps
    end
  end
end
