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

  def runtime_parser
    current_runtime = self.runtime
  end

  def movie_runtime
    runtime = Time.parse(runtime_parser)
  end

  def runtime_with_changeover
    split_runtime = runtime_parser.split(':')
    runtime_hour = split_runtime[0].to_i * (60 * 60)
    runtime_min = split_runtime[1].to_i * 60
    changeover_time = (35 * 60)

    (runtime_hour  + runtime_min + changeover_time)
  end

  def set_first_showtime(theater)
    first_possible_showtime = theater.opening_time

    showtimes.push first_possible_showtime if showtimes.length == 0
    round_showtimes(showtimes[0])
  end

  # def set_last_showtime
  # end

  def set_next_showtimes
    theater_closing_time = theater.closing_time
    last_possible_showtime = theater_closing_time - runtime_with_changeover

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

  # def movie_endtimes
  #   showtimes.map do |showtime|
  #
  # end

  def schedule_movie_showtimes
    # set_last_showtime
    set_first_showtime(theater)
    set_next_showtimes
  end

  def display_movie_info
    puts "\n"
    puts "#{movie_title}" + " - Rated: #{mpaa_rating}, #{runtime_parser}"
  end

  def display_movie_showtimes
    current_showtimes = []

    showtimes.map do |showtime|
      showtime_formatted = showtime.strftime('%I:%M %P')
      # endtime_formatted = movie_endtimes.strftime('%I:%M %P')

      current_showtimes.push " #{showtime_formatted}" # - #{endtime_formatted}
    end
    puts current_showtimes
  end

  def display_movie_scheduler
    schedule_movie_showtimes
    display_movie_info
    display_movie_showtimes
  end
end
