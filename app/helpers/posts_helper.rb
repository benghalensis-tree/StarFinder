require 'mk_sunmoon'
require 'mk_calendar'

module PostsHelper

  def moon_age(date)
    date_time = date.strftime('%Y%m%d')
    day = MkCalendar.new("#{date_time}")
    # binding.pry
    if day.moonage > 29 || 1 > day.moonage 
      'super_good'
    elsif day.moonage > 25 || 5 > day.moonage 
      'good'
    elsif day.moonage > 20 || 10 > day.moonage 
      'normal'
    elsif day.moonage > 18 || 13 > day.moonage 
      'short'
    else
      'bad'
    end
  end
  
end
