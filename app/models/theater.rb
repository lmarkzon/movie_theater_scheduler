class Theater
  attr_accessor :location, :opening_time, :closing_time, :movies

  def initialize(args = {})
    @location = args[:location]
    @opening_time = args[:opening_time]
    @closing_time = args[:closing_time]
    @movies = args[:movies]
  end
end
