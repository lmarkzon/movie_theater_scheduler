require_relative 'app/controllers/showtimes_controller'
require 'time'

# puts
filename = ARGV.first
todays_showtimes = ShowtimesController.new
puts "Running file: #{filename}"
todays_showtimes.movie_theater_scheduler(filename)
