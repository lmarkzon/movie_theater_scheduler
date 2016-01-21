require 'csv'
require_relative '../models/movie'
require_relative '../models/theater'

class ShowtimesController
  def movie_theater_scheduler(filename)
    @movies_array = []
    @theater_array = []

    CSV.foreach(filename, :headers => false) do |row|
      # if ...
        movie_parser(row)
      # if/else ...
        theater_parser
      end
    display_movie_theater_schedule()
  end

  def movie_parser(row)
    @movie = Movie.new(theater: row[0], movie_title: row[1], release_year: row[2], mpaa_rating: row[3], runtime: row[4])
    @movies_array.push(@movie)
    puts @movies_array
  end

  def theater_parser(row)
    @theater = Theater.new(location: row[0], opening_time: row[1], closing_time: row[2])
    @theater_array.push(@theater)
    puts @theater_array
  end

  def display_movie_theater_schedule

  end
end
