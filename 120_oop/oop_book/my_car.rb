module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :speed, :running, :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @@number_of_vehicles += 1
    @year = year
    @model = model
    @color = color
    @speed = 0
  end

  def self.number_of_vehicles
    puts @@number_of_vehicles
  end

  def self.gas_mileage(miles_per_tank, gallons_per_tank)
    "#{miles_per_tank / gallons_per_tank}"
  end

  def turn_on
    self.running = true
  end
  
  def turn_off
    self.speed == 0 ? self.running = false : "The car is still moving. Stop first."
  end
  
  def current_speed
    self.speed
  end
  
  def speed_up(amount)
    self.running ? self.speed += amount : "The car is off. Nothing happens."
  end

  def brake(amount)
    self.speed -= amount
  end
  
  def stop
    self.speed = 0
  end
  
  def spray_paint(color)
    self.color = color
  end
  
  def age
    "Your #{self.model} is #{years_old} years old."
  end
  
  private
  
  def years_old
    Time.now.year - self.year.to_i
  end
end
  
class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Towable
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

fusion = MyCar.new("2012", "Ford Fusion", "Black")
f150 = MyTruck.new("1998", "GMC Sonoma", "While")
fusion.turn_on
fusion.speed_up(20)
fusion.brake(10)
p fusion.current_speed
fusion.stop
fusion.turn_off
puts fusion.year
fusion.spray_paint('Tuxedo Black')
puts fusion.color
puts MyCar.gas_mileage(300, 15)
puts fusion
puts f150
Vehicle.number_of_vehicles
puts "--- Truck Methods ---"
p MyTruck.ancestors
puts "--- Car Methods ---"
p MyCar.ancestors
p fusion.age
p f150.age