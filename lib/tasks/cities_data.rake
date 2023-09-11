namespace :import do
  desc 'Import cities from csv'
    task cities: [:environment] do
      list = []
      CSV.foreach('db/csv/cities.csv') do |row|
        unless City.find_by(name: row[0]).presence
          list << {
            name: row[0],
            latitude: row[1],
            longitude: row[2]
          }
        end
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