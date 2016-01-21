require 'time'

class Theater
  attr_accessor :location, :opening_time, :closing_time, :movies

  def initialize(args = {})
    @location = args[:location]
    @opening_time = args[:opening_time]
    @closing_time = args[:closing_time]
    @movies = []
  end

  def opening_time
    Time.parse(@opening_time).strftime('%I:%M %p')
  end

  def closing_time
    Time.parse(@closing_time).strftime('%I:%M %p')
  end

  # def total_time_open
  # ends

  def set_theater_hours(row)
    if t.friday? or t.saturday? or t.sunday?
      @opening_time -= 30.strftime("%M")
      @closing_time += 30.strftime("%M")
    else
      @opening_time
      @closing_time
    end
  end

  def display_location_and_hours
    puts "Theater #{location} is open today from #{opening_time} - #{closing_time}"
  end
end
