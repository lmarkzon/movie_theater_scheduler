class TheaterView
  def display_date_info
    puts Time.now.strftime("%A, %m/%d/%Y")
  end

  def display_theater_info(theater)
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "#{theater.location} "
    display_date_info
    puts "Hours: #{theater.opening_time.strftime('%I:%M %P')} to #{theater.closing_time.strftime('%I:%M %P')}"
  end
end
