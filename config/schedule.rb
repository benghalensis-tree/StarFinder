require File.expand_path(File.dirname(__FILE__) + "/environment")
set :environment, Rails.env.to_sym
env :PATH, ENV['PATH']
set :output, "#{Rails.root.to_s}/log/cron.log"
set :job_template, "/bin/zsh -l -c ':job'"
job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

every 1.day, at: ['4:00 am', '3:00 pm'] do
  rake 'open_weather_api:weather_forecasts_1'
end
every 1.day, at: ['4:05 am', '3:05 pm'] do
  rake 'open_weather_api:weather_forecasts_2'
end
every 1.day, at: ['4:10 am', '3:10 pm'] do
  rake 'open_weather_api:weather_forecasts_3'
end
