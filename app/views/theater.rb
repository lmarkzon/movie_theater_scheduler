require 'rainbow'

class TheaterView

  def display_date_info
    today_is = (Time.now).strftime("%A, %m/%d/%Y")
    puts Rainbow(today_is).yellow
  end

  def display_hours(theater)
    opening_time = theater.opening_time.strftime('%I:%M %P')
    closing_time = theater.closing_time.strftime('%I:%M %P')

    puts Rainbow("Hours: " + opening_time + " to " + closing_time).yellow
  end

  def display_theater_info(theater)
    puts Rainbow("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~").bright.magenta
    puts Rainbow(theater.location).bright.yellow.underline
    display_date_info
    display_hours(theater)
  end
end
