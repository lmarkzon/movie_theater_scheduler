class Movie
  attr_reader :movie_title, :release_year, :mpaa_rating, :run_time, :play_times
  attr_accessor :theater

  def initialize(args = {})
    @movie_title = args[:movie_title]
    @release_year = args[:release_year]
    @mpaa_rating = args[:mpaa_rating]
    @run_time = args[:run_time]
    @theater = args[:theater]
    @play_times = []
  end
end
