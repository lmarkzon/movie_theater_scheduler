require_relative 'app/controllers/showtimes_controller'

filename = ARGV.first
puts "Running your file: #{filename}"
showtimes(filename)
