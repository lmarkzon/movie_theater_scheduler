class Movie
  attr_reader :movie_title, :release_year, :mpaa_rating, :runtime
  attr_accessor  :showtimes, :theater

  def initialize(args = {})
    @movie_title = args[:movie_title]
    @release_year = args[:release_year]
    @mpaa_rating = args[:mpaa_rating]
    @runtime = args[:runtime]
    @theater = args[:theater]
    @showtimes = []
  end

  def movie_runtime

  end

  def set_showtimes

  end
end
