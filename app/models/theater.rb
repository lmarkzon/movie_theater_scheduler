class Theater
  attr_accessor :location, :opening_time, :closing_time, :movies

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

  def total_time_open
    # total number of minutes open in a day
  end

  def display_hours
    # display hours open
  end
end
