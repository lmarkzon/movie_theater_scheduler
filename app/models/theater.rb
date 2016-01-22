require 'time'

class Theater
  attr_reader :location, :opening_time, :closing_time, :movies

  def initialize(args = {})
    @location = args[:location]
    @opening_time = args[:opening_time]
    @closing_time = args[:closing_time]
    @movies = []
  end

  def opening_time
    Time.parse(@opening_time)
  end

  def closing_time
    Time.parse(@closing_time)
  end

  def set_theater_hours(row)
    if t.friday? or t.saturday? or t.sunday?
      @opening_time -= 30.strftime("%m")
      @closing_time += 30.strftime("%m")
      # opening_time == 10:30('%I:%M %A')?
      # closing_time == 23:30('%I:%M %P')?
    else
      @opening_time
      @closing_time
    end
  end

  def display_date_info
    puts Time.now.strftime("%A, %m/%d/%Y")
  end

  def display_theater_info
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "#{location} "
    display_date_info
    puts "Hours: #{opening_time.strftime('%I:%M %P')} to #{closing_time.strftime('%I:%M %P')}"
  end
end
