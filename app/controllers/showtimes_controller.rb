require 'csv'
require_relative '../models/movie'
require_relative '../models/theater'

class ShowtimesController
  def movie_theater_scheduler(filename)
    @movies_array = []
    @theater_array = []

    CSV.foreach(filename, :headers => true) do |row|
      movie_parser(row)
      puts theater = 'Theater: ' + row[0]
      puts movie_title = 'Movie: ' + row[1]
      puts release_year = 'Released: ' + row[2]
      puts mpaa_rating = 'Rated: ' + row[3]
      puts runtime = 'Runtime: ' + row[4]
    end
  end

  def movie_parser(row)
    @movie = Movie.new(theater: row[0], movie_title: row[1], release_year: row[2], mpaa_rating: row[3], runtime: row[4])
    @movies_array << @movie
  end

  # def theater_parser(row)
  # end

  def set_theater_movies
    # set movies to assigned theaters?
  end

  def display_movie_theater_schedule(theaters)
    # list theater, and it's movies with showtimes
  end
end
