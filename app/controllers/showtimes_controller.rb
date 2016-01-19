require 'csv'
require_relative '../models/movie'
require_relative '../models/theater'

def showtimes(filename)
  CSV.foreach(filename, :headers => true) do |row|
    p row
  end
end
