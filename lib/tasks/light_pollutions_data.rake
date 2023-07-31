require 'csv'

namespace :import do
  desc "Import GaN2022 from csv"
  task light_pollutions_data: :environment do
    path = File.join Rails.root, "db/csv/GaN2022.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          latitude: row["Latitude"],
          longitude: row["Longitude"],
          limitingmag: row["LimitingMag"]
      }
    end
    puts "start to create"
    begin
      LightPollution.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
