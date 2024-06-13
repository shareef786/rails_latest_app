# class Vehicle
#   attr_reader :vehicle_number

#   def initialize(vehicle_number)
#     @vehicle_number = vehicle_number
#   end
# end

require 'debug'

class Spot
  attr_reader :spot_number, :vehicle, :start_time

  def initialize(spot_number)
    @spot_number = spot_number
    @vehicle = nil
  end

  def park_vehicle(vehicle)
    @vehicle = vehicle
    @start_time = Time.now
  end

  def remove_vehicle(vehicle)
    @vehicle = nil
  end

  def available?
    @vehicle.nil?
  end
end

class Floor
  attr_reader :floor_number, :spots

  def initialize(floor_number, number_of_spots)
    @floor_number = floor_number
    @spots = 1.upto(number_of_spots).map{|s| Spot.new(s)}
  end

  def available_spot
    @spots.find{|s| s if s.available?}
  end

  def display_availability
    available_spots = @spots.select{|s| s.available?}
    puts "#{available_spots.count} available Spots in floor #{floor_number}"
    puts available_spots.inspect
  end
end

class ParkingLot
  attr_reader :floors
  
  def initialize(number_of_floors, spots_per_each_floor)
    @floors = 1.upto(number_of_floors).map{|f| Floor.new(f, spots_per_each_floor)}
  end

  def park_vehicle(vehicle_number)
    @floors.each do |f|
      # binding.break
      available_spot = f.available_spot
      if available_spot
        available_spot.park_vehicle(vehicle_number)
        puts "Vehicle number #{vehicle_number} has parked in spot #{available_spot.spot_number} in floor #{f.floor_number}"
        return
      end
    end

    puts "parking lot is full"
  end

  def remove_vehicle(floor_number, spot_number, vehicle_number)
    floor = @floors.find{|f| f.floor_number == floor_number}
    spot = floor.spots.find{|s| s.spot_number == spot_number}
    if spot 
      spot.remove_vehicle(vehicle_number)
      # binding.break
      parking_duration = ((spot.start_time + 1*60*60) - Time.now)/60
      need_to_pay = parking_duration/60 * 40
      puts "Please pay #{need_to_pay} for Duration #{parking_duration}"
      puts "Vehicle number #{vehicle_number} has removed from spot#{spot_number} in floor#{floor_number}"
    end
  end

  # def display_availability
    # @floors.each{|floor| puts floor.display_availability}
  # end

  def method_missing(method_name)
    puts "#{method_name} does not exist"
    puts "Now creating display_availability method"
    # self.class::class_eval{ define_method(:display_availability){@floors.each{|floor| puts floor.display_availability} }}
    self.class.send( :define_method, method_name, lambda{ @floors.each{|floor| puts floor.display_availability}})
    self.class.send( :define_method, :xyz, lambda {puts "Hello World"})
    # self.class::class_eval{ define_method(:xyz){ puts "Hello World"}}
  end
end

parking_lot = ParkingLot.new(3, 3)
parking_lot.display_availability
# puts parking_lot.inspect
# parking_lot.park_vehicle("KA03NE8144")
# parking_lot.park_vehicle("HYD03NE1234")
# parking_lot.park_vehicle("PY03NE1234")
# parking_lot.park_vehicle("TN03NE1234")
# parking_lot.remove_vehicle(1,1,"KA03NE8144")
parking_lot.display_availability
parking_lot.xyz
