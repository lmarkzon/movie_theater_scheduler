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

  def runtime_with_changeover

  end

  def set_next_showtime

  end

  def set_first_showtime

  end

  def set_last_showtime

  end

  def round_up

  end

  def display_movie_showtimes

  end

  def display_movie_theater_scheduler
    set_showtimes
    display_movie_showtimes
  end
end
