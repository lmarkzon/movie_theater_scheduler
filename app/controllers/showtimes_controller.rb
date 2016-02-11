require_relative '../models/movie'
require_relative '../models/theater'
require 'csv'

class ShowtimesController

  attr_reader :theater_array, :movie_array

  def initialize
    @theater_view = TheaterView.new
    @movie_view = MovieView.new
    @theater_array = []
    @movie_array = []
  end

  def theater_parser(row)
    theater = Theater.new(location: row[1], opening_time: row[2], closing_time: row[3])
    theater_array << theater
  end

  def movie_parser(row)
    movie = Movie.new(movie_title: row[1], release_year: row[2], mpaa_rating: row[3], runtime: row[4])
    movie_array << movie
  end

  def movie_theater_scheduler(filename)
    CSV.foreach(filename) do |row|
      case
      when row[0] == 'Theater' then theater_parser(row)
      when row[0] == 'Movie' then movie_parser(row)
      when row[0] == 'Set' then set_theater_movies(row)
      else
        puts "Error: Please enter a file with valid information."
      end
    end
    display_movie_theater_scheduler(theater_array)
  end

  def set_theater_movies(row)
    theater_array.each do |theater|
      if theater.location == row[2]
        current_movie = movie_array.find do |movie|
          movie.movie_title == row[1]
        end
        movies_in_theater = theater.movies
        new_movie = Movie.new(movie_title: current_movie.movie_title, release_year: current_movie.release_year, mpaa_rating: current_movie.mpaa_rating, runtime: current_movie.runtime, theater: theater)

        movies_in_theater << new_movie
      end
    end
  end

  def display_movie_theater_scheduler(theaters)
    theaters.each do |theater|
      @theater_view.display_theater_info(theater)
      theater.movies.each do |movie|
        @movie_view.display_movie_scheduler(movie)
      end
    end
  end
end
