require 'debug'

class Movie
  attr_reader :movie_name, :duration

  def initialize(movie_name, duration)
    @movie_name, @duration = movie_name, duration
  end
end

class Theator
  attr_reader :id, :name, :shows

  def initialize(id, name, shows)
    @id, @name, @shows = id, name, shows
  end
end

class Show
  attr_reader :id, :movie, :theator, :start_time, :end_time, :seats

  def initialize(id, movie, theator, start_time, end_time, seats)
    @id, @movie, @theator, @start_time, @end_time, @seats = id, movie, theator, start_time, end_time, seats
  end
end

class Seat
  attr_reader :seat_number, :type, :price, :status

  def initialize(seat_number, type, price, status)
    @seat_number, @type, @price, @status = seat_number, type, price, status
  end
end

class Booking
  attr_reader :booking_id, :status, :user, :show, :seats, :price

  def initialize(booking_id, status, user, show, seats, price)
    @booking_id, @status, @user, @show, @seats, @price = booking_id, status, user, show, seats, price
  end
end

class BookingSystem

  def run
    m1 = Movie.new('OG', 120)
    t1 = Theator.new(1, 'vinayaka', 4)
    show1 = Show.new('s1', m1, t1, Time.now, Time.now + m1.duration, create_seats(3,3))
    selected_seats = show1.seats.first, show1.seats.last
    if are_available_seats(show1, selected_seats)
      # get total_price
      # generate booking id
      booking = Booking.new(booking_id, 'PENDING', user, show1, selected_seats, price)
      # do payment
      #confirm booking
      # mark_seats_booked
    end
  end

  def create_seats(rows, cols)
    seats = []
    1.upto(rows) do |row|
      1.upto(cols) do |col|
        seat_number = "#{row}-#{col}"
        seat_type = row < 2 ? 'Premium' : 'Normal'
        price = seat_type == 'Premium' ? 180.00 : 100.00
        status = 'Available'
        seat_hash = {seat_number: seat_number, seat: Seat.new(seat_number, seat_type, price, status)}
        seats << seat_hash
      end
    end
    return seats
  end

  def are_available_seats(show, selected_seats)
    selected_seats.each do |selected_seat|
      available_seat = show.seats.find{|s| s[:seat_number] == selected_seat[:seat_number]}
      return false if available_seat[:seat].status != 'Available'
    end
    return true
  end
end

BookingSystem.new.run