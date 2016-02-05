require_relative '../views/theater'
require 'time'

class Theater
  attr_reader :location, :opening_time, :closing_time, :movies

  def initialize(args = {})
    @location = args[:location]
    @opening_time = args[:opening_time]
    @closing_time = args[:closing_time]
    @movies = []
  end

  def today
    Time.now
  end

  def opening_time
    if today.friday? or today.saturday? or today.sunday?
      # Time.parse(@opening_time)
      @opening_time -= (30 * 60)
    else
      Time.parse(@opening_time)
    end
  end

  def closing_time
    if today.friday? or today.saturday? or today.sunday?
      # Time.parse(@closing_time)
      @closing_time += (30 * 60)
    else
      Time.parse(@closing_time)
    end
  end
end
