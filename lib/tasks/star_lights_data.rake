require 'csv'

namespace :import do
  desc "Import MoE2019_S from csv"
  task MoE2019_S: :environment do
    path = File.join Rails.root, "db/csv/MoE2019_S.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      if row["magnitude"].to_f < 17
        rank = 1
      elsif row["magnitude"].to_f < 18
        rank = 2
      elsif row["magnitude"].to_f < 19
        rank = 3
      elsif row["magnitude"].to_f < 20
        rank = 4
      elsif row["magnitude"].to_f < 21
        rank = 5
      elsif row["magnitude"].to_f >= 21
        rank = 6
      end
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          magnitude: row["magnitude"],
          rank: rank,
        }
    end
    puts "start to create"
    begin
      StarLight.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import MoE2020_S from csv"
  task MoE2020_S: :environment do
    path = File.join Rails.root, "db/csv/MoE2020_S.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      if row["magnitude"].to_f < 17
        rank = 1
      elsif row["magnitude"].to_f < 18
        rank = 2
      elsif row["magnitude"].to_f < 19
        rank = 3
      elsif row["magnitude"].to_f < 20
        rank = 4
      elsif row["magnitude"].to_f < 21
        rank = 5
      elsif row["magnitude"].to_f >= 21
        rank = 6
      end
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          magnitude: row["magnitude"],
          rank: rank,
        }
    end
    puts "start to create"
    begin
      StarLight.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import MoE2020_W from csv"
  task MoE2020_W: :environment do
    path = File.join Rails.root, "db/csv/MoE2020_W.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      if row["magnitude"].to_f < 17
        rank = 1
      elsif row["magnitude"].to_f < 18
        rank = 2
      elsif row["magnitude"].to_f < 19
        rank = 3
      elsif row["magnitude"].to_f < 20
        rank = 4
      elsif row["magnitude"].to_f < 21
        rank = 5
      elsif row["magnitude"].to_f >= 21
        rank = 6
      end
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          magnitude: row["magnitude"],
          rank: rank,
        }
    end
    puts "start to create"
    begin
      StarLight.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import MoE2021_S from csv"
  task MoE2021_S: :environment do
    path = File.join Rails.root, "db/csv/MoE2021_S.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      if row["magnitude"].to_f < 17
        rank = 1
      elsif row["magnitude"].to_f < 18
        rank = 2
      elsif row["magnitude"].to_f < 19
        rank = 3
      elsif row["magnitude"].to_f < 20
        rank = 4
      elsif row["magnitude"].to_f < 21
        rank = 5
      elsif row["magnitude"].to_f >= 21
        rank = 6
      end
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          magnitude: row["magnitude"],
          rank: rank,
        }
    end
    puts "start to create"
    begin
      StarLight.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import MoE2021_W from csv"
  task MoE2021_W: :environment do
    path = File.join Rails.root, "db/csv/MoE2021_W.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      if row["magnitude"].to_f < 17
        rank = 1
      elsif row["magnitude"].to_f < 18
        rank = 2
      elsif row["magnitude"].to_f < 19
        rank = 3
      elsif row["magnitude"].to_f < 20
        rank = 4
      elsif row["magnitude"].to_f < 21
        rank = 5
      elsif row["magnitude"].to_f >= 21
        rank = 6
      end
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          magnitude: row["magnitude"],
          rank: rank,
        }
    end
    puts "start to create"
    begin
      StarLight.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import MoE2022_S from csv"
  task MoE2022_S: :environment do
    path = File.join Rails.root, "db/csv/MoE2022_S.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      if row["magnitude"].to_f < 17
        rank = 1
      elsif row["magnitude"].to_f < 18
        rank = 2
      elsif row["magnitude"].to_f < 19
        rank = 3
      elsif row["magnitude"].to_f < 20
        rank = 4
      elsif row["magnitude"].to_f < 21
        rank = 5
      elsif row["magnitude"].to_f >= 21
        rank = 6
      end
      list << {
          latitude: row["latitude"],
          longitude: row["longitude"],
          magnitude: row["magnitude"],
          rank: rank,
        }
    end
    puts "start to create"
    begin
      StarLight.create!(list) 
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end

namespace :import do
  desc "Import all MoE data from csv"
  task star_lights: [:environment, :MoE2019_S, :MoE2020_S, :MoE2020_W, :MoE2021_S, :MoE2021_W, :MoE2022_S] do
    puts "All MoE data imported successfully!"
  end
end