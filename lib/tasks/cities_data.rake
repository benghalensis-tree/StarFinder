namespace :import do
  desc 'Import cities from csv'
    task cities: [:environment] do
      list = []
      CSV.foreach('db/csv/cities.csv') do |row|
        list << {
          name: row[0],
          latitude: row[1],
          longitude: row[2]
        }
      end

      puts 'start creating cities'
      begin
        City.create!(list)
        puts 'completed!'
      rescue ActiveModel::UnknownAttributeError
        puts 'raised error: unknown attributes'
      end
    end
end