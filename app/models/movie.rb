require_relative '../views/movie'
require 'time'

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
    current_runtime = self.runtime
  end

  def movie_runtime_parser
    runtime = Time.parse(movie_runtime)
  end

  def runtime_with_changeover
    split_runtime = movie_runtime.split(':')
    runtime_hour = split_runtime[0].to_i * (60 * 60)
    runtime_min = split_runtime[1].to_i * 60
    changeover_time = (35 * 60)

    (runtime_hour + runtime_min + changeover_time)
  end

  def set_first_showtime(theater)
    first_possible_showtime = theater.opening_time

    showtimes.push first_possible_showtime if showtimes.length == 0
    round_showtimes(showtimes[0])
  end

  def last_possible_showtime
    theater_closing_time = theater.closing_time
    theater_closing_time - runtime_with_changeover
  end

  def set_next_showtimes
    until showtimes.last + runtime_with_changeover > last_possible_showtime
      showtimes.push round_showtimes(showtimes.last + runtime_with_changeover)
    end
  end

  def round_showtimes(showtime)
    case
     when showtime.min % 5 != 0
      Time.at((showtime.to_time.to_i / 300.0).ceil * 300)
    else
      showtime
    end
  end

  def schedule_movie_showtimes
    set_first_showtime(theater)
    set_next_showtimes
  end
end
