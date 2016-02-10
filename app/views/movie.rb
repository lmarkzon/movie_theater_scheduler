class MovieView
  def display_movie_info(movie)
    puts "\n"
    puts Rainbow(movie.movie_title + " - Rated: " + movie.mpaa_rating + ", " + movie.movie_runtime).cyan
  end

  def display_movie_showtimes(movie)
    current_showtimes = []

    movie.showtimes.map do |showtime|
      showtime_formatted = showtime.strftime('%I:%M %P')

      current_showtimes.push Rainbow(showtime_formatted).bright.cyan
    end
    puts current_showtimes
  end

  def display_movie_scheduler(movie)
    movie.schedule_movie_showtimes
    display_movie_info(movie)
    display_movie_showtimes(movie)
  end
end
