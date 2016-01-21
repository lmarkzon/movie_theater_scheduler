require 'csv'
require_relative '../models/movie'
require_relative '../models/theater'

class ShowtimesController
  def movie_theater_scheduler(filename)
    @movies_array = []
    @theater_array = []

    CSV.foreach(filename, :headers => false) do |row|
      if row[0] == 'Theater'
        theater_parser(row)
      else
        movie_parser(row)
        end
      end
    display_movie_theater_schedule(@theater_array)
  end

  def movie_parser(row)
    @movie = Movie.new(movie_title: row[0], theater: row[1], release_year: row[2], mpaa_rating: row[3], runtime: row[4])
    @movies_array.push(@movie)
    # puts @movies_array
  end

  def theater_parser(row)
    @theater = Theater.new(location: row[1], opening_time: row[2], closing_time: row[3])
    @theater_array.push(@theater)
    # puts @theater_array
  end

  def display_movie_theater_schedule(theater_array)
    theater_array.each do |array|
      array.display_location_and_hours
        array.movies.each {|array| array.print_movie_schedule }
    end
  end
end
