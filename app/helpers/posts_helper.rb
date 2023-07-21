require 'mk_sunmoon'
require 'mk_calendar'

module PostsHelper

  def moon_age(date)
    date_time = date.strftime('%Y%m%d')
    day = MkCalendar.new("#{date_time}")
    # binding.pry
    if day.moonage > 27 || 3 > day.moonage 
      'super_good'
    elsif day.moonage > 25 || 5 > day.moonage 
      'good'
    elsif day.moonage > 21 || 8 > day.moonage 
      'normal'
    elsif day.moonage > 19 || 10 > day.moonage 
      'short'
    else
      'bad'
    end
  end

  def moon_confirm(date)
    date_time = date.strftime('%Y%m%d')
    moon = MkSunmoon.new("#{date_time}")
    set = moon.moonset
    rise = moon.moonrise
    unless set[0]=="--:--:--"
      m_set = set[0].to_time
      moon_set = m_set.change(year: date.year, month: date.month, day: date.day)
      moon_set.to_datetime
    else
      moon_set = Time.new(2000, 1, 1, 0, 0, 0).to_datetime
    end 
    unless rise[0]=="--:--:--"
      m_rise = rise[0].to_time 
      moon_rise = m_rise.change(year: date.year, month: date.month, day: date.day)
      moon_rise = moon_rise.to_datetime  
    else
      moon_rise = Time.new(2000, 1, 1, 0, 0, 0).to_datetime
    end 
    return moon_set, moon_rise
  end
   
  def moon_time(date)
    moon_set = moon_confirm(date)[0]
    moon_rise = moon_confirm(date)[1]
    moon = []
    if moon_set < moon_rise
      if moon_set == Time.new(2000, 1, 1, 0, 0, 0).to_datetime
        date += 1
        moon_set = moon_confirm(date)[0]
      end
      moon[0] = "月没 #{moon_set.hour}時#{moon_set.min}分"
      if moon_rise == Time.new(2000, 1, 1, 0, 0, 0).to_datetime
        date += 1
        moon_rise = moon_confirm(date)[1]
      end
      moon[1] = "月出 #{moon_rise.hour}時#{moon_rise.min}分"
      return moon

    else

      moon[0]= "月没 #{moon_set.hour}時#{moon_set.min}分"
      date += 1
      moon_rise = moon_confirm(date)[1]
      moon[1] = "月出 #{moon_rise.hour}時#{moon_rise.min}分"
      return moon
    end
  end
end
