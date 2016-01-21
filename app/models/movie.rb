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

  def runtime
    # format movie runtime
  end

  def runtime_with_changeover
    # runtime + 35 minutes
  end

  def set_last_showtime
    # set movies to end right at closing_time
  end

  def set_first_showtime
    # set first movies to start an hour after opening_time
  end

  def set_next_showtime
    # set remaining movies showtimes in between first and last
  end

  def round_showtimes
    # round up minute of showtimes to end with 0 or 5
  end

  def set_movie_showtimes
    set_last_showtime
    set_first_showtime
    set_next_showtimes
  end

  def display_movie_info

  end

  def display_movie_showtimes
    # iterate through and display showtimes
  end

  def display_movie_theater_scheduler
    set_movie_showtimes
    display_movie_info
    display_movie_showtimes
  end
end
