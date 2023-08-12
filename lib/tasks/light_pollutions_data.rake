require 'csv'

namespace :import do
  desc "Import GaN2022 from csv"
  task GaN2022: :environment do
    path = File.join Rails.root, "db/csv/GaN2022_Japan.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          latitude: row["Latitude"],
          longitude: row["Longitude"],
          limiting_mag: row["LimitingMag"]
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

  desc "Import GaN2021 from csv"
  task GaN2021: :environment do
    path = File.join Rails.root, "db/csv/GaN2021_Japan.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          latitude: row["Latitude"],
          longitude: row["Longitude"],
          limiting_mag: row["LimitingMag"]
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

  desc "Import GaN2020 from csv"
  task GaN2020: :environment do
    path = File.join Rails.root, "db/csv/GaN2020_Japan.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          latitude: row["Latitude"],
          longitude: row["Longitude"],
          limiting_mag: row["LimitingMag"]
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

  desc "Import GaN2019 from csv"
  task GaN2019: :environment do
    path = File.join Rails.root, "db/csv/GaN2019_Japan.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          latitude: row["Latitude"],
          longitude: row["Longitude"],
          limiting_mag: row["LimitingMag"]
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

namespace :import do
  desc "Import all GaN data from csv"
  task light_pollutions: [:environment, :GaN2022, :GaN2021, :GaN2020, :GaN2019] do
    puts "All GaN data imported successfully!"
  end
end

