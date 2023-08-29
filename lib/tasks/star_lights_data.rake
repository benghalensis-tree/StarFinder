require 'csv'

namespace :import do
  desc "Import MoE2019_S from csv"
  task MoE2019_S: :environment do
    path = File.join Rails.root, "db/csv/MoE2019_S.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          limiting_mag: row["star_light"]
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
  desc "Import MoE2019_S from csv"
  task MoE2020_W: :environment do
    path = File.join Rails.root, "db/csv/MoE2020_W.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          limiting_mag: row["star_light"]
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