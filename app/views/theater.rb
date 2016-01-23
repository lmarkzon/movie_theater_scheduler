require 'rainbow'

class TheaterView
  def display_date_info
    puts Rainbow(Time.now.strftime("%A, %m/%d/%Y")).yellow
  end

  def display_theater_info(theater)
    puts Rainbow("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~").bright.magenta
    puts Rainbow("#{theater.location} ").bright.yellow.underline
    display_date_info
    puts Rainbow("Hours: #{theater.opening_time.strftime('%I:%M %P')} to #{theater.closing_time.strftime('%I:%M %P')}").yellow
  end
end
