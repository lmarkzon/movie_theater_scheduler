require_relative 'app/controllers/showtimes_controller'

filename = ARGV.first
todays_showtimes = ShowtimesController.new
puts "Running your file: #{filename}"
todays_showtimes.movie_showtimes(filename)
