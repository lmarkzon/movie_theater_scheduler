class MovieView
  def display_movie_info(movie)
    puts "\n"
    puts "#{movie.movie_title}" + " - Rated: #{movie.mpaa_rating}, #{movie.runtime_parser}"
  end

  def display_movie_showtimes(movie)
    current_showtimes = []

    movie.showtimes.map do |showtime|
      showtime_formatted = showtime.strftime('%I:%M %P')
      # endtime_formatted = movie_endtimes.strftime('%I:%M %P')

      current_showtimes.push " #{showtime_formatted}" # - #{endtime_formatted}
    end
    puts current_showtimes
  end

  def display_movie_scheduler(movie)
    movie.schedule_movie_showtimes
    display_movie_info(movie)
    display_movie_showtimes(movie)
  end
end
